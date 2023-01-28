part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {
  final List<Map> cartProducts;

  CartEvent({required this.cartProducts});
}

class AddToCartEvent extends CartEvent{
  AddToCartEvent({required super.cartProducts});
}

class RemoveFromCartEvent extends CartEvent{
  RemoveFromCartEvent({required super.cartProducts});
}

class IncrementProductEvent extends CartEvent{
  IncrementProductEvent({required super.cartProducts});
}

class DecrementProductEvent extends CartEvent{
  DecrementProductEvent({required super.cartProducts});
}