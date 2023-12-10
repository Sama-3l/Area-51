// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, must_be_immutable

import 'package:area_51/constants/colors.dart';
import 'package:area_51/presentation/widgets/homeWidgets/homeScreenLists.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../data/repositories/products_Repo.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.theme, required this.products});

  LightMode theme;
  ProductList products;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(key: PageStorageKey<String>('Home'), children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
            aspectRatio: 12 / 3,
            child: Center(
              child: Text("Area 51",
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: widget.theme.oppAccent,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic)),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: AspectRatio(
            aspectRatio: 1.12,
            child: HomeScreenLists(
              theme: widget.theme,
              title: "New Arrival",
              products: widget.products,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: AspectRatio(
          aspectRatio: 1.1,
          child: HomeScreenLists(
            theme: widget.theme,
            title: "Recommendation",
            products: widget.products,
          ),
        ),
      ),
    ]);
  }
}
