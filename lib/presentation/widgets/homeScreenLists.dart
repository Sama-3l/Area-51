// ignore_for_file: prefer_const_constructors, must_be_immutable, curly_braces_in_flow_control_structures

import 'package:area_51/presentation/widgets/products/homePageProductItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/models/product.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:area_51/data/repositories/products_Repo.dart';

class HomeScreenLists extends StatefulWidget {
  HomeScreenLists({super.key, required this.title, required this.theme});

  String title;
  LightMode theme;

  @override
  State<HomeScreenLists> createState() => _HomeScreenListsState();
}

class _HomeScreenListsState extends State<HomeScreenLists> {
  late List<Product> productsList = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 10; i++)
      productsList.add(Product(price: 222, name: "Hello"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 23, bottom: 30),
          child: AutoSizeText(widget.title,
              maxFontSize: 24,
              minFontSize: 17,
              style: GoogleFonts.poppins(
                  color: widget.theme.oppAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 24))),
      Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsList.length,
              itemBuilder: ((context, index) {
                return ProductItem(
                    theme: widget.theme,
                    homeScreen: true,
                    dimensions: 180,
                    radius: 25,
                    index: index,
                    product: productsList[index],);
              }))),
    ]);
  }
}
