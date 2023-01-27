// ignore_for_file: prefer_const_constructors

import 'package:area_51/business_logic/blocs/catalogBloc/catalog_bloc.dart';
import 'package:area_51/presentation/screens/cart.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
            aspectRatio: 5,
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
              margin: EdgeInsetsDirectional.only(start: 2, end: 2, bottom: 30),
              decoration: BoxDecoration(
                border: Border.all(color: widget.theme.oppAccent, width: 3),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: IconButton(
                              onPressed: () {
                                BlocProvider.of<CatalogBloc>(context).add(ShowCatalogEvent(widget.product));
                              },
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.arrow_back_ios_new_rounded,
                                  size: 39, color: widget.theme.oppAccent)),
                        ),
                        Spacer(flex: 3),
                        Text("Laptops",
                            style: GoogleFonts.poppins(
                                fontSize: 25,
                                color: widget.theme.oppAccent,
                                fontWeight: FontWeight.w500)),
                        Spacer(flex: 5)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView(
                          children: [
                            LayoutBuilder(builder: ((context, constraints) {
                              return SizedBox(
                                height: 350,
                                width: constraints.maxWidth,
                                child: FractionallySizedBox(
                                  widthFactor: 0.9,
                                  heightFactor: 0.85,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: widget.theme.productAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                ),
                              );
                            })),
                            LayoutBuilder(builder: ((context, constraints) {
                              return Center(
                                  child: Column(children: [
                                SizedBox(
                                  width: constraints.maxWidth * 0.9,
                                  child: AutoSizeText(
                                    "${widget.product.name}",
                                    maxFontSize: 23,
                                    minFontSize: 18,
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                        color: widget.theme.oppAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.9,
                                  child: AutoSizeText(
                                    "\$${widget.product.price}",
                                    maxFontSize: 18,
                                    minFontSize: 13,
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        color: widget.theme.oppAccent
                                            .withOpacity(0.5),
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    width: constraints.maxWidth * 0.9,
                                    child: AutoSizeText(
                                      "${widget.product.description}",
                                      maxFontSize: 15,
                                      minFontSize: 10,
                                      maxLines: 6,
                                      style: GoogleFonts.poppins(
                                          color: widget.theme.oppAccent,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ]));
                            })),
                          ],
                        ),
                        LayoutBuilder(builder: ((context, constraints) {
                          return Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                elevation: 1,
                                child: Container(
                                  height: constraints.maxHeight * 0.18,
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: widget.theme.oppAccent
                                            .withOpacity(0.25),
                                        offset: Offset(0, -7),
                                        blurRadius: 20)
                                  ], color: widget.theme.mainAccent),
                                ),
                              ));
                        })),
                      ],
                    ),
                  ),
                ],
              )),
        ))
      ]),
    );
  }
}
