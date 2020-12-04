import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mephi_guide/data/http_data.dart';
import 'package:mephi_guide/data/http_fetch.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/i_fetcher.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/mephi_guide/lib/data/news/news.dart';

import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

  main() {
  final client = MockClient();

  test('returns a http_data if the http call completes successfully', () async {

    HttpData newsData = HttpData((str) => newsListFromJson(str));

    when(client.get('http://194.87.232.95:45555/home/getnews?inst=5'))
        .thenAnswer((_) async => http.Response('[{'
        '"id":5,'
        '"name":"Test piece of news",'
        '"institution":0,'
        '"t":"Test time",'
        '"place":"Test place",'
        '"text":"lorem ipsum",'
        '"top_img":null,'
        '"idPlace":2}]', 200));

    var expected = [News(
      id: 5,
      name: "Test piece of news",
      institution: 0,
      time: "Test time",
      place: "Test place",
      text: "lorem ipsum",
      topImg: null,
      idPlace: 2
    )];

    List<News> res;

    var callback = expectAsync1(
            (event) {
              res = event;
              expect(res, expected);
              //print("ass");
            }
    );

    newsData.outData.listen(callback);

    newsData.loadData("getnews?inst=5", client);

  });

  test('returns a http_list_data if the json conversion call completes successfully', () async {

    HttpListData<News> newsListData = HttpListData((jsonMap) => News.fromJson(jsonMap));

    when(client.get('http://194.87.232.95:45555/home/getnews?inst=0')).
    thenAnswer((realInvocation) async =>
        http.Response('[{'
            '"id":5,'
            '"name":"Test piece of news for icis",'
            '"institution":5,'
            '"t":"Test time",'
            '"place":"Test place",'
            '"text":"lorem ipsum",'
            '"top_img":null,'
            '"idPlace":2},'
            '{'
            '"id":0,'
            '"name":"Test piece of news for everyone",'
            '"institution":0,'
            '"t":"Test time",'
            '"place":"Test place",'
            '"text":"dolor sid amet",'
            '"top_img":null,'
            '"idPlace":1}'
            ']', 200))
      ;

    var expected = [
      News(
        id: 5,
        name: "Test piece of news for icis",
        institution: 5,
        time: "Test time",
        place: "Test place",
        text: "lorem ipsum",
        topImg: null,
        idPlace: 2
      ),
      News(
          id: 0,
          name: "Test piece of news for everyone",
          institution: 0,
          time: "Test time",
          place: "Test place",
          text: "dolor sid amet",
          topImg: null,
          idPlace: 1
      )
    ];

    List<News> res;

    var callback = expectAsync1(
            (event) {
          res = event;
          expect(res, expected);
          //print("ass");
        }
    );

    newsListData.outData.listen(callback);

    newsListData.loadData("getnews?inst=0", client);
  });
}