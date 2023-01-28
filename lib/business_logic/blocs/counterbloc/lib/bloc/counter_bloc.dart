import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:counterbloc/model/cartProducts.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(CounterInitial(cart: CartProducts(cartProducts: []))) {
    on<AddProduct>((event, emit) {
      // emit new state
      emit(ProductAdded(cart: event.cart));
    });
  }
}
