// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:area_51/data/models/user.dart';
import 'package:area_51/data/repositories/products_Repo.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import '../../../business_logic/cubits/themeCubit/theme_cubit.dart';
import '../../screens/home.dart';
import '../../screens/cart.dart';
import '../../screens/account.dart';
import '../../pages/catalog.dart';
import 'package:area_51/constants/colors.dart';

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
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.11,
          right: MediaQuery.of(context).size.width * 0.11,
          bottom: MediaQuery.of(context).size.height * 0.065),
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.width * 0.9 / 80,
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
                      Tab(icon: Icon(CarbonIcons.home)),
                      Tab(icon: Icon(CarbonIcons.search)),
                      Tab(icon: Icon(CarbonIcons.shopping_bag)),
                      Tab(icon: Icon(CarbonIcons.user_avatar)),
                    ]))),
      ),
    );
  }
}

class BottomNavBarTabs extends StatefulWidget {
  BottomNavBarTabs(
      {super.key,
      required this.state,
      required this.theme,
      required this.user});

  ThemeState state;
  LightMode theme;
  CurrentUser user;

  @override
  State<BottomNavBarTabs> createState() => _BottomNavBarTabsState();
}

class _BottomNavBarTabsState extends State<BottomNavBarTabs> {
  final ProductList allProducts = ProductList();

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Home(theme: widget.theme, products: allProducts),
      Catalog(
          theme: widget.theme, catalogProducts: allProducts, user: widget.user),
      Cart(theme: widget.theme, user: widget.user),
      Account(state: widget.state, theme: widget.theme, user: widget.user)
    ]);
  }
}
