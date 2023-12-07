// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:area_51/business_logic/blocs/cartBloc/cart_bloc.dart';
import 'package:area_51/constants/methods.dart';
import 'package:area_51/data/models/user.dart';
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

  Methods methods = Methods();

  @override
  Widget build(BuildContext context) {
    return forAddition
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GestureDetector(
              onTap: () {
                methods.increment(context, user, productCartIndex);
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
                methods.decrement(context, user, productCartIndex);
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
