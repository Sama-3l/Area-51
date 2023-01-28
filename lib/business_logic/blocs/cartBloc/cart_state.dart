part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  final List<Map> cartProducts;

  CartState({required this.cartProducts});
}

class CartInitial extends CartState {
  CartInitial({required super.cartProducts});
}

class AddedToCartState extends CartState{
  AddedToCartState({required super.cartProducts});
}

class RemovedFromCartState extends CartState{
  RemovedFromCartState({required super.cartProducts});
}

class IncrementProductState extends CartState{
  IncrementProductState({required super.cartProducts});
}

class DecrementProductState extends CartState{
  DecrementProductState({required super.cartProducts});
}