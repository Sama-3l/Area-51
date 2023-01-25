// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable{
  late CartProducts cart;

  CartEvent({required this.cart});
}

class ProductAddedEvent extends CartEvent{
  ProductAddedEvent({required super.cart});

  @override
  List<Object?> get props => [];
}

class ProductRemovedEvent extends CartEvent{
  ProductRemovedEvent({required super.cart});

  @override
  List<Object?> get props => [];
}
