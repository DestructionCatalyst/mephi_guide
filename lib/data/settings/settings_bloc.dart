import 'dart:async';

import 'package:mephi_guide/data/cached_http_data.dart';
import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/news/group.dart';


class SettingsBloc implements Disposable{

  static const String groupsPage = "getgroups";

  Group currentGroup = Group(
      id: 0,
      name: "(Гость)",
      institution: 0
  );

  HttpListData<Group> groupsData;

  final StreamController<SettingsEvent>_eventController = StreamController<SettingsEvent>();

  Sink<SettingsEvent> get inEvent => _eventController.sink;
  Stream<SettingsEvent> get _outEvent => _eventController.stream;

  StreamController<String> _groupNameController;

  Sink<String> get _inData => _groupNameController.sink;
  Stream<String> get outData => _groupNameController.stream;

  SettingsBloc([HttpListData<Group> groupsListData]){

    groupsData = groupsListData ?? CachedHttpData("groups", (json) => Group.fromJson(json));

    //Load data on the start
    groupsData.loadData(groupsPage);

    //Add event listener
    _outEvent.listen(_handleEvent);

    _groupNameController = StreamController<String>.broadcast(onListen: () => loadGroupName);

    loadGroupName();
  }

  void loadGroupName(){
    DBProvider.queryCurrentGroupName().then((value) => _inData.add(value));

  }

  void _handleEvent(SettingsEvent event){
    if(event is GroupUpdatedEvent){
      currentGroup = event.newGroup;
      DBProvider.updateUtilityValue("currentGroupID", event.newGroup.id.toString());
      DBProvider.updateUtilityValue("currentInstitutionID", event.newGroup.institution.toString());

      loadGroupName();
    }
    else{
      //Should never reach here
      throw Exception("Unexpected event!");
    }
  }

  @override
  void dispose(){
    groupsData.dispose();
    _eventController.close();
    _groupNameController.close();
  }
}

abstract class SettingsEvent{}

class GroupUpdatedEvent extends SettingsEvent{
  final Group newGroup;

  GroupUpdatedEvent(this.newGroup);
}