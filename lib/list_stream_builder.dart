import 'package:flutter/material.dart';

class MyStreamBuilder<T> extends StatefulWidget {
  final Stream<List<T>> stream;
  final Widget placeholder;
  final Widget Function(List<dynamic>) builder;

  const MyStreamBuilder({Key key, @required this.stream, @required this.placeholder, @required this.builder}) : super(key: key);

  @override
  _MyStreamBuilderState createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState<T> extends State<MyStreamBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
      stream: widget.stream,
      builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot){
        if(snapshot.hasData) {
          print(snapshot.data);
          return widget.builder(snapshot.data);
        }
        else{
          print("loading placeholder");
          return widget.placeholder;
        }
      }
    );
  }
}

