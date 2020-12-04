import 'dart:async';

import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/news/group.dart';
import 'package:mephi_guide/data/news/news_events.dart';

import 'news.dart';

class NewsBloc implements Disposable{

  static const String newsPage = "getnews?inst=";
  static const String groupsPage = "getgroups";

  bool targeting = false;
  Group currentGroup = Group(
    id: 0,
    name: "(Гость)",
    institution: 0
  );

  HttpListData<News> newsData;
  HttpListData<Group> groupsData;

  final StreamController<NewsEvent>_eventController = StreamController<NewsEvent>();

  Sink<NewsEvent> get inEvent => _eventController.sink;
  Stream<NewsEvent> get _outEvent => _eventController.stream;


  NewsBloc([HttpListData<News> newsListData, HttpListData<Group> groupsListData]){

    //Initialize ListData's
    if(newsListData == null)
      newsData = HttpListData((json) => News.fromJson(json));
    else
      newsData = newsListData;

    if(groupsListData == null)
      groupsData = HttpListData((json) => Group.fromJson(json));
    else
      groupsData = groupsListData;

    //Load data on the start
    groupsData.loadData(groupsPage);
    newsData.loadData(newsPage + "0");

    //Add event listener
    _outEvent.listen(_handleEvent);
  }

  void _handleEvent(NewsEvent event){
    if(event is GroupUpdatedEvent){
      //Save new group and reload the list
      currentGroup = event.newGroup;
      reloadNews();
    }
    else if (event is TargetingSwitchedEvent){
      //Save new flag and reload the list
      targeting = event.newTargeting;
      reloadNews();
    }
    else{
      //Should never reach here
      throw Exception("Unexpected event!");
    }
  }

  void reloadNews(){
    if(targeting)
      newsData.loadData(newsPage + currentGroup.institution.toString());
    else
      newsData.loadData(newsPage + "0");
  }

  @override
  void dispose(){
    newsData.dispose();
    groupsData.dispose();
    _eventController.close();
  }
}