import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mephi_guide/data/http_fetch.dart';
import 'package:mephi_guide/data/i_fetcher.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

main() {
  test('returns piece of news if the http call completes successfully', () async {
    final client = MockClient();
    final IFetcher fetcher = Fetcher();

    http.Response expected = http.Response('[{'
        '"id":5,'
        '"name":"Test piece of news",'
        '"institution":0,'
        '"t":"01.01.2001,01:01",'
        '"place":"Test place",'
        '"text":"lorem ipsum",'
        '"top_img":null,'
        '"idPlace":2}]', 200);

    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.get('http://194.87.232.95:45555/home/getnews'))
        .thenAnswer((_) async => http.Response('[{'
          '"id":5,'
          '"name":"Test piece of news",'
          '"institution":0,'
          '"t":"01.01.2001,01:01",'
          '"place":"Test place",'
          '"text":"lorem ipsum",'
          '"top_img":null,'
          '"idPlace":2}]', 200));

    http.Response actual = await fetcher.fetch(client, "getnews");

    print(actual.body);

    print("<\/h4><br>");
    
    expect(actual.body, expected.body);
    expect(actual.statusCode, expected.statusCode);
  });
}



