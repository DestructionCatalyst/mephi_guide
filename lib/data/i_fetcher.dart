import 'package:http/http.dart' as http;

abstract class IFetcher{

  Future<http.Response> fetch(http.Client client, String sitePage);
}