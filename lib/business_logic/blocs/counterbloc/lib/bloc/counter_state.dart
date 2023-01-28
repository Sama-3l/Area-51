// ignore_for_file: prefer_const_constructors_in_immutables

part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final CartProducts cart;

  CounterState({required this.cart});
}

class CounterInitial extends CounterState {
  CounterInitial({required super.cart});
}

class ProductAdded extends CounterState {
  ProductAdded({required super.cart});
}
