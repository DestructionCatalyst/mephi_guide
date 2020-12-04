import 'package:mephi_guide/data/news/group.dart';

abstract class NewsEvent{}

class GroupUpdatedEvent extends NewsEvent{
  Group newGroup;
}

class TargetingSwitchedEvent extends NewsEvent{
  bool newTargeting;
}
