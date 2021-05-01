abstract class IApiAuthProvider {
  Future<dynamic> getAsync({
    String path,
    String authToken,
  });

  Future<dynamic> postAsync({
    String path,
    dynamic data,
    String authToken,
  });

  Future<dynamic> deleteAsync({
    String path,
    String authToken,
  });

  Future<dynamic> putAsync({
    String path,
    dynamic data,
    String authToken,
  });
}
