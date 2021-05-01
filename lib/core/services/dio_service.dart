import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioService {
  GetStorage _box = GetStorage();

  /// BaseUri: the baseApiUri you want to make the call,
  /// BaseUriToken: the baseTokenUri to make the call to get the token
  /// AuthToken: the string name where you want the GetStorage to save the token
  /// ClientId: the clientId of app registration in AD you want to make use of
  /// Scope: the scope you wanna access of app registration in AD
  /// ClientSecret: the secret you created on app registration in AD
  /// grantType: the grant type to use
  Dio getCustomDio({
    String baseApiUri,
    String baseTokenUri,
    String authToken,
    // required String clientId ,
    // required String scope ,
    // required String redirectUri ,
    // required String state ,
  }) {
    Dio _tokenDio = Dio(
      BaseOptions(
        baseUrl: baseTokenUri,
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.json,
      ),
    );

    Dio _dio = Dio(
      BaseOptions(
        baseUrl: baseApiUri,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      if (_box.read(authToken) == null) {
        _dio.interceptors.requestLock.lock();
        // We use a new Dio(to avoid dead lock) instance to request token.
        _tokenDio.post(
          '/token',
          data: {
            // 'client_id': clientId,
            // 'scope': scope,
            // 'redirect_uri': redirectUri,
            // 'state': state
          },
        ).then((response) async {
          //Set the token to headers
          options.headers["authorization"] =
              'Bearer ${response.data['access_token']}';
          await _box.write(authToken, options.headers["authorization"]);
          handler.next(options); //continue
        }).catchError((error, stackTrace) {
          handler.reject(error, true);
        }).whenComplete(() => _dio.interceptors.requestLock.unlock());
      } else {
        options.headers["authorization"] = _box.read(authToken);

        handler.next(options);
      }
    }));

    return _dio;
  }

  Dio getRawDio(String baseUrl) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    return dio;
  }
}
