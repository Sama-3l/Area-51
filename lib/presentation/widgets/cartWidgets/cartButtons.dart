import 'dart:convert';

import 'package:area_51/business_logic/blocs/cartBloc/cart_bloc.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/colors.dart';
import '../../../data/models/product.dart';


class CartButtons extends StatelessWidget {
  CartButtons(
      {super.key,
      required this.theme,
      required this.icon,
      required this.forAddition,
      required this.cart,
      required this.product,
      required this.productCartIndex});

  LightMode theme;
  IconData icon;
  bool forAddition;
  CartProducts cart;
  Product product;
  int productCartIndex;

  void increment() {
    final Product product = cart.cartProducts[productCartIndex]['name'];
    cart.cartProducts[productCartIndex]['count'] =
        cart.cartProducts[productCartIndex]['count'] + 1;
  }

  void decrement() {
    cart.cartProducts[productCartIndex]['count'] =
        cart.cartProducts[productCartIndex]['count'] - 1;
    if (cart.cartProducts[productCartIndex]['count'] == 0) {
      cart.cartProducts.removeAt(productCartIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return forAddition
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GestureDetector(
              onTap: () {
                increment();
                BlocProvider.of<CartBloc>(context)
                    .add(AddToCartEvent(cartProducts: cart.cartProducts));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: theme.mainAccent,
                    borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(icon, size: 13, color: theme.oppAccent),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: GestureDetector(
              onTap: () {
                decrement();
                BlocProvider.of<CartBloc>(context)
                    .add(AddToCartEvent(cartProducts: cart.cartProducts));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: theme.oppAccent,
                    borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(icon, size: 13, color: theme.mainAccent),
                ),
              ),
            ),
          );
  }
}
