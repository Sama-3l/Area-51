import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(cart: CartProducts())) {
    on<ProductAddedEvent>((event, emit) {
      emit(AddedToCartState(cart: event.cart));
    });
    on<ProductRemovedEvent>((event, emit) {
      emit(RemovedFromCartState(cart: event.cart));
    });
  }
}
