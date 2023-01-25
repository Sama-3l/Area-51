// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  late CartProducts cart;

  CartState({required this.cart});
}

class CartInitial extends CartState {
  CartInitial({required super.cart});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddedToCartState extends CartState {
  AddedToCartState({required super.cart});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RemovedFromCartState extends CartState {
  RemovedFromCartState({required super.cart});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
