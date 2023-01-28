part of 'widget_bloc.dart';

@immutable
abstract class WidgetState {
  final int count;

  WidgetState({required this.count});
}

class WidgetInitial extends WidgetState {
  WidgetInitial({required super.count});
}

class ShowButtonsState extends WidgetState {
  ShowButtonsState({required super.count});
}

class ShowResultState extends WidgetState {
  ShowResultState({required super.count});
}