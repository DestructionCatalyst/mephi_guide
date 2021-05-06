import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:mephi_guide/data/news/group.dart';
import 'package:mephi_guide/data/settings/settings_bloc.dart';
import 'package:mephi_guide/list_stream_builder.dart';
import 'package:mephi_guide/tab/tab.dart';

class SettingsTab extends StatefulWidget {
  final SettingsBloc bloc = SettingsBloc();

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  GlobalKey<AutoCompleteTextFieldState<Group>> key = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Group>> placeholderKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MyTab(
      name: "Настройки",
      titleTop: 148,
      children: [
        buildGroupSelect(),
      ],
    );
  }

  Positioned buildGroupSelect() {

    return Positioned(
        top: 197,
        left: 8,
        child: Container(
          width: 360,
          height: 50,
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Группа", textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(46, 31, 112, 1),
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1
                  ),),
                ),
                  Ink(
                    width: 160,
                    height: 50,
                    child: MyStreamBuilder<Group>(
                      stream: widget.bloc.groupsData.outData,
                      builder: buildTextView,
                      placeholder: buildACTF(placeholderKey, [])
                    )
                  )
              ],
            ),
          ),
        ),
    );
  }

  Widget buildTextView(List<dynamic> data){

    var groupData = data as List<Group>;
    //groupData.add(Group(id: 0, name: "(Гость)", institution: 0));
    return buildACTF(key, data as List<Group>);
  }



  AutoCompleteTextField<Group> buildACTF(Key myKey, List<Group> suggestions){
    var actf =  AutoCompleteTextField<Group>(
      key: myKey,
      suggestions: suggestions,
      itemSorter: (a, b) => a.name.compareTo(b.name),
      itemSubmitted: (item) {
        setState(() {
          widget.bloc.inEvent.add(GroupUpdatedEvent(item));
          print("Selected group $item");
        });
      },
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          height: 1
      ),
      itemFilter: (item, query) => item.name.toLowerCase().startsWith(query.toLowerCase()),
      itemBuilder: (context, item) => Text(item.name),
    ).controller.text = "";
  }
}
