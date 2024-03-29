// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(cartProducts: [])) {
    on<AddToCartEvent>((event, emit) {
      emit(AddedToCartState(cartProducts: event.cartProducts));
    });
    on<RemoveFromCartEvent>((event, emit) {
      emit(RemovedFromCartState(cartProducts: event.cartProducts));
    });
  }
}
