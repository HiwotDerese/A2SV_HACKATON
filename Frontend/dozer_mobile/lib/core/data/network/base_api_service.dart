abstract class BaseApiService {
  Future<dynamic> getResponse(String url);

  Future<dynamic> postResponse(String url, Map<String, dynamic> jsonBody);

  Future<dynamic> putResponse(String url, Map<String, dynamic> jsonBody);

  Future<dynamic> deleteResponse(String url);

  Future<dynamic> patchResponse(String url, Map<String, dynamic> jsonBody);
}
