// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:area_51/presentation/screens/cart.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(cartProducts: [])) {
    on<AddToCartEvent>((event, emit) {
      emit(AddedToCartState(cartProducts: event.cartProducts));
    });
  }
}
