// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/data/repositories/products_Repo.dart';
import 'package:area_51/presentation/pages/productPage.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import '../../business_logic/cubits/themeCubit/theme_cubit.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/cart.dart';
import '../screens/account.dart';
import '../pages/catalog.dart';
import 'package:area_51/constants/colors.dart';
import 'package:area_51/constants/dimensions.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, required this.state, required this.theme});

  ThemeState state;
  LightMode theme;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 350 / 80,
      child: Padding(
          padding: EdgeInsets.only(bottom: 17, left: 7, right: 7),
          child: Container(
              decoration: BoxDecoration(
                  color: widget.theme.oppAccent,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: TabBar(
                  labelColor: widget.theme.mainAccent,
                  unselectedLabelColor:
                      widget.theme.mainAccent.withOpacity(0.5),
                  indicator: BoxDecoration(),
                  tabs: [
                    Tab(icon: Icon(CarbonIcons.home, size: 30)),
                    Tab(icon: Icon(CarbonIcons.search, size: 30)),
                    Tab(icon: Icon(CarbonIcons.shopping_bag, size: 30)),
                    Tab(icon: Icon(CarbonIcons.user_avatar, size: 30)),
                  ]))),
    );
  }
}

class BottomNavBarTabs extends StatefulWidget {
  BottomNavBarTabs(
      {super.key,
      required this.state,
      required this.theme,
      required this.cart});

  ThemeState state;
  LightMode theme;
  CartProducts cart;

  @override
  State<BottomNavBarTabs> createState() => _BottomNavBarTabsState();
}

class _BottomNavBarTabsState extends State<BottomNavBarTabs> {
  final ProductList allProducts = ProductList();

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Home(theme: widget.theme, products: allProducts),
      // ProductPage(theme: widget.theme, product: allProducts.productList[0]),
      Catalog(theme: widget.theme, cart: widget.cart, catalogProducts: allProducts),
      Cart(theme: widget.theme, cart: widget.cart),
      Account(state: widget.state, theme: widget.theme)
    ]);
  }
}
