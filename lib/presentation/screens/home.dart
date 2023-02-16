// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/models/product.dart';
import 'package:area_51/presentation/widgets/homeWidgets/homeScreenLists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final ref = FirebaseFirestore.instance.collection('Products');

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.products.productList.length; i++) {
      final Product product = widget.products.productList[i];
      ref.doc(product.name).set({
        "name": product.name,
        "price": product.price,
        "description": product.description
      });
    }
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
      AspectRatio(
        aspectRatio: 1.1,
        child: HomeScreenLists(
          theme: widget.theme,
          title: "Recommendation",
          products: widget.products,
        ),
      ),
    ]);
  }
}
