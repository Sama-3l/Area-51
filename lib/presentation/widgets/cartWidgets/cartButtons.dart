import 'dart:convert';

import 'package:area_51/business_logic/blocs/cartBloc/cart_bloc.dart';
import 'package:area_51/constants/methods.dart';
import 'package:area_51/data/models/user.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      required this.product,
      required this.productCartIndex,
      required this.user});

  LightMode theme;
  IconData icon;
  bool forAddition;
  Product product;
  int productCartIndex;
  CurrentUser user;

  final userData = FirebaseFirestore.instance.collection('Users');
  Methods methods = Methods();

  void increment() async {
    user.cartProducts.cartProducts[productCartIndex]['count'] =
        user.cartProducts.cartProducts[productCartIndex]['count'] + 1;

    final userData =
        FirebaseFirestore.instance.collection('Users').doc(user.username);
    userData
        .update({'cart': methods.cartEntry(user.cartProducts.cartProducts)});
  }

  void decrement() {
    user.cartProducts.cartProducts[productCartIndex]['count'] =
        user.cartProducts.cartProducts[productCartIndex]['count'] - 1;
    if (user.cartProducts.cartProducts[productCartIndex]['count'] == 0) {
      user.cartProducts.cartProducts.removeAt(productCartIndex);
    }
    final userData =
        FirebaseFirestore.instance.collection('Users').doc(user.username);
    if (user.cartProducts.cartProducts.isEmpty) {
      userData.update({'cart': null});
    } else {
      userData
          .update({'cart': methods.cartEntry(user.cartProducts.cartProducts)});
    }
    print(user.cartProducts.cartProducts);
  }

  @override
  Widget build(BuildContext context) {
    return forAddition
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GestureDetector(
              onTap: () {
                increment();
                BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                    cartProducts: user.cartProducts.cartProducts));
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
                BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                    cartProducts: user.cartProducts.cartProducts));
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
