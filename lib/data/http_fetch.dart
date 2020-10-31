import 'package:http/http.dart' as http;

import 'i_fetcher.dart';

class Fetcher extends IFetcher
{
  final _linkBase = "http://194.87.232.95:45555/home/";

  Future<http.Response> fetch(http.Client client, String sitePage) {
    return client.get(_linkBase + sitePage);
  }

}