import 'package:flutter/material.dart';
import 'package:mephi_guide/data/news/group.dart';
import 'package:mephi_guide/data/settings/settings_bloc.dart';
import 'package:mephi_guide/data/timetable/timetable_bloc.dart';
import 'package:mephi_guide/list_stream_builder.dart';
import 'package:mephi_guide/tab/tab.dart';

class TimetableTab extends StatefulWidget {
  final TimetableBloc bloc = TimetableBloc();

  @override
  _TimetableTabState createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {

  @override
  Widget build(BuildContext context) {
    var tab = MyTab(
      name: "Расписание",
      titleTop: 148,
      children: [
        Positioned(
          top: 150,
            child: MyStreamBuilder(
                stream: widget.bloc.outData,
                placeholder: Text("Error"),
                builder: (data)=>Text(data.toString())
            )
        )

      ],
    );

    return tab;
  }

}
