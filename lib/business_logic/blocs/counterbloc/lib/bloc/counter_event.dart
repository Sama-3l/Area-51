part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  final CartProducts cart;

  CounterEvent({required this.cart});
}

class AddProduct extends CounterEvent{
  AddProduct({required super.cart});
  
}

class RemoveProduct extends CounterEvent {
  RemoveProduct({required super.cart});
}