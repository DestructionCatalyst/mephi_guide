

import 'dart:async';

import 'package:mephi_guide/data/disposable.dart';

abstract class EventHandler<E> implements Disposable{
  final StreamController<E>_eventController = StreamController<E>();

  Sink<E> get inEvent => _eventController.sink;
  Stream<E> get _outEvent => _eventController.stream;

  EventHandler() {
    _outEvent.listen(_handleEvent);
  }

  void _handleEvent(E event);

  @override
  void dispose(){
    _eventController.close();
  }
}