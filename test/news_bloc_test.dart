import 'package:flutter_test/flutter_test.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/news/group.dart';
import 'package:mephi_guide/data/news/news.dart';
import 'package:mephi_guide/data/news/news_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockNewsData extends Mock implements HttpListData<News> {
  @override
  // TODO: implement outData
  Stream<List<News>> get outData => throw UnimplementedError();
  @override
  // TODO: implement inData
  Sink<List<News>> get inData => throw UnimplementedError();
}
class MockGroupsData extends Mock implements HttpListData<Group> {}

main() {

  HttpListData<News> newsData = new MockNewsData();
  HttpListData<Group> groupsData = new MockGroupsData();



  News forAll = News(
      id: 0,
      name: "Test piece of news for everyone",
      institution: 0,
      time: "Test time",
      place: "Test place",
      text: "dolor sid amet",
      topImg: null,
      idPlace: 1
  );

  News forIcis = News(
      id: 5,
      name: "Test piece of news for icis",
      institution: 5,
      time: "Test time",
      place: "Test place",
      text: "lorem ipsum",
      topImg: null,
      idPlace: 2
  );

  News forLaplas = News(
      id: 2,
      name: "Test piece of news for laplas",
      institution: 2,
      time: "Test time",
      place: "Test place",
      text: "consectetur adipiscing elit",
      topImg: null,
      idPlace: 0
  );

  List<Group> groups = [
    Group(
      id: 0,
      name: 'Гость',
      institution: 0
    ),
    Group(
      id: 1,
      name: "Б19-514",
      institution: 5
    )
  ];

  when(newsData.loadData("getnews?inst=0")).thenAnswer((realInvocation) =>
     [forAll, forIcis, forLaplas]
  );

  when(newsData.loadData("getnews?inst=5")).thenAnswer((realInvocation) =>
  [forAll, forIcis]
  );

  when(groupsData.loadData("getgroups")).thenAnswer((realInvocation) => groups);

  NewsBloc newsBloc = new NewsBloc(newsData, groupsData);

  test('news_bloc correctness', () async {

    List<Group> actualGroups ;

    var callback = expectAsync1(
            (event) {
          actualGroups = event;
          expect(actualGroups, groups);
        }
    );

    newsBloc.groupsData.outData.listen(callback);


  });
}