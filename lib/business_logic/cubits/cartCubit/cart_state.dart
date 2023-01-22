part of 'cart_cubit.dart';

@immutable
abstract class CartState {
  late List<Product> cartProducts;
}

class CartInitial extends CartState {
  List<Product> cartProducts = [];

  CartInitial({required this.cartProducts});
}
