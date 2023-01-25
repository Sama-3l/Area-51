// ignore_for_file: prefer_const_constructors

import 'package:area_51/presentation/screens/cart.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc/bloc.dart';

import 'package:area_51/constants/colors.dart';

import '../../data/models/product.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.theme, required this.product});

  LightMode theme;
  Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme.mainAccent,
      body: Column(children: [
        AspectRatio(
            aspectRatio: 4,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Area 51",
                    style: GoogleFonts.poppins(
                        fontSize: 31,
                        color: widget.theme.oppAccent,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic)))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Container(
              margin: EdgeInsetsDirectional.only(start: 20, end: 20),
              decoration: BoxDecoration(
                border: Border.all(color: widget.theme.oppAccent, width: 3),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: ListView(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(Icons.arrow_back_ios_new_rounded, size: 39),
                      ),
                      Spacer(flex: 2),
                      Text("Laptops",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: widget.theme.oppAccent,
                              fontWeight: FontWeight.w500)),
                      Spacer(flex: 4)
                    ],
                  )),
                  Expanded(child: Container(color: Colors.red))
                ],
              )),
        ))
      ]),
    );
  }
}
