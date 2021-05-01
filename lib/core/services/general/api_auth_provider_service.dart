import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:pub_tran_exercise/core/enums/enum_http_method.dart';
import 'package:pub_tran_exercise/core/utils/custom_exception.dart';
import 'package:pub_tran_exercise/globals/constants.dart';

import 'dio_service.dart';

class ApiAuthProviderService implements IApiAuthProvider {
  ApiAuthProviderService() {
    _dioService = DioService();
    _apiAuthManager = _dioService.getCustomDio(
      baseApiUri: kBaseUrl,
      baseTokenUri: kTokenUrl,
      authToken: kApiAuthToken,
    );
    _apiManager = _dioService.getRawDio(kBaseUrl);
  }

// Fields
  DioService _dioService;
  Dio _apiAuthManager;
  Dio _apiManager;

  // Methods
  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.data.toString());
        return responseJson;
      case 204:
        throw NoContentException(message: response.statusMessage.toString());
      case 400:
        throw BadRequestException(message: response.statusMessage.toString());
      case 401:
        throw UnauthorisedException(message: response.statusMessage.toString());
      case 403:
        throw ForbiddenException(message: response.statusMessage.toString());
      case 404:
        throw NotFoundException(message: response.statusMessage.toString());
      case 500:
        throw InternalServerErrorException(
            message: response.statusMessage.toString());
      case 501:
        throw NotImplementedException(
            message: response.statusMessage.toString());
      default:
        throw FetchDataException(message: response.statusMessage.toString());
    }
  }

  dynamic _populateResponse(
      {String path, EnumHttpMethod httpMethod, String authToken}) async {
    var responseJson;
    try {
      var response;

      if (authToken == null) {
        switch (httpMethod) {
          case EnumHttpMethod.get:
            response = await _apiManager.get(path);
            break;
          case EnumHttpMethod.post:
            response = await _apiManager.post(path);
            break;
          case EnumHttpMethod.delete:
            response = await _apiManager.delete(path);
            break;
          case EnumHttpMethod.put:
            response = await _apiManager.put(path);
            break;
        }
      } else {
        Options options = Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        );
        switch (httpMethod) {
          case EnumHttpMethod.get:
            response = await _apiAuthManager.get(
              path,
              options: options,
            );
            break;
          case EnumHttpMethod.post:
            response = await _apiAuthManager.post(
              path,
              options: options,
            );
            break;
          case EnumHttpMethod.delete:
            response = await _apiAuthManager.delete(
              path,
              options: options,
            );
            break;
          case EnumHttpMethod.put:
            response = await _apiAuthManager.put(
              path,
              options: options,
            );
            break;
        }
      }

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    } on DioError catch (e) {
      if (e.response == null) {
        throw NullException(
            message:
                'The request can not reach to the http server or occurring a dns error or network is not available');
      } else {
        var response =
            e.response ?? Response(requestOptions: RequestOptions(path: path));
        _response(response);
      }
    }
    return responseJson;
  }

  @override
  Future<dynamic> deleteAsync({String path, String authToken}) async {
    try {
      return _populateResponse(
          path: path, httpMethod: EnumHttpMethod.delete, authToken: authToken);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  @override
  Future<dynamic> getAsync({String path, String authToken}) async {
    try {
      return _populateResponse(
          path: path, httpMethod: EnumHttpMethod.get, authToken: authToken);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  @override
  Future<dynamic> postAsync(
      {String path, dynamic data, String authToken}) async {
    try {
      return _populateResponse(
          path: path, httpMethod: EnumHttpMethod.post, authToken: authToken);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  @override
  Future<dynamic> putAsync(
      {String path, dynamic data, String authToken}) async {
    try {
      return _populateResponse(
          path: path, httpMethod: EnumHttpMethod.put, authToken: authToken);
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }
}
