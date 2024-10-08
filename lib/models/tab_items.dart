import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class TabItems {
  final UniqueKey id = UniqueKey();
  final String stateMachine;
  final String artboard;
  late SMIBool? status;

  TabItems({this.stateMachine = '', this.artboard = '', this.status});

  static List<TabItems> tabItemList = [
    TabItems(stateMachine: 'CHAT_Interactivity', artboard: 'CHAT'),
    TabItems(stateMachine: 'SEARCH_Interactivity', artboard: 'SEARCH'),
    TabItems(stateMachine: 'TIMER_Interactivity', artboard: 'TIMER'),
    TabItems(stateMachine: 'BELL_Interactivity', artboard: 'BELL'),
    TabItems(stateMachine: 'USER_Interactivity', artboard: 'USER'),
  ];
}
