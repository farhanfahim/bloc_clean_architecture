
abstract class BaseApiService{

  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url, String data);
}