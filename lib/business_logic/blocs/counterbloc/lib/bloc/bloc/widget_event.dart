// ignore_for_file: prefer_const_constructors_in_immutables

part of 'widget_bloc.dart';

@immutable
abstract class WidgetEvent {
  late final int count;

  WidgetEvent({required this.count});
}

class ShowButtonsEvent extends WidgetEvent{
  ShowButtonsEvent({required super.count});
}

class ShowResultEvent extends WidgetEvent{
  ShowResultEvent({required super.count});
}
