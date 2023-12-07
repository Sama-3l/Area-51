// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:area_51/business_logic/blocs/catalogBloc/catalog_bloc.dart';
import 'package:area_51/constants/methods.dart';
import 'package:area_51/data/models/user.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:area_51/constants/colors.dart';

import '../../business_logic/blocs/cartBloc/cart_bloc.dart';
import '../../data/models/product.dart';

class ProductPage extends StatefulWidget {
  ProductPage(
      {super.key,
      required this.theme,
      required this.product,
      required this.user});

  LightMode theme;
  Product product;
  CurrentUser user;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  Methods methods = Methods();

  void buyButtonMethod() {
    bool productExists = false;
    int productIndex = 0;
    for (int i = 0; i < widget.user.cartProducts.cartProducts.length; i++) {
      if (widget.product.productId ==
          widget.user.cartProducts.cartProducts[i]['name'].productId) {
        productExists = true;
        productIndex = i;
      }
    }
    DefaultTabController.of(context).animateTo(2);
    if (!productExists) {
      final Map addToCart = {
        "name": widget.product,
        "count": 1,
      };
      widget.user.cartProducts.cartProducts.add(addToCart);
    } else {
      widget.user.cartProducts.cartProducts[productIndex]['count'] =
          widget.user.cartProducts.cartProducts[productIndex]['count'] + 1;
    }
    BlocProvider.of<CartBloc>(context).add(
        AddToCartEvent(cartProducts: widget.user.cartProducts.cartProducts));
  }

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
                                BlocProvider.of<CatalogBloc>(context)
                                    .add(ShowCatalogEvent(widget.product));
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
                                    widget.product.name,
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
                                      widget.product.description,
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
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: FractionallySizedBox(
                                            heightFactor: 0.6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25, top: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Price",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: widget
                                                                  .theme
                                                                  .oppAccent
                                                                  .withOpacity(
                                                                      0.7))),
                                                  Text(
                                                      '\$${widget.product.price}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: widget
                                                                  .theme
                                                                  .oppAccent))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                              alignment: Alignment.topRight,
                                              child: SizedBox(
                                                child: LayoutBuilder(builder:
                                                    ((context, constraints) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20, right: 20),
                                                    child: BlocBuilder<CartBloc,
                                                        CartState>(
                                                      builder:
                                                          (context, state) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              buyButtonMethod(),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: widget
                                                                      .theme
                                                                      .oppAccent,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              60))),
                                                              height: constraints
                                                                      .maxHeight *
                                                                  0.2,
                                                              width: constraints
                                                                      .maxWidth *
                                                                  0.55,
                                                              child: Center(
                                                                child: Text(
                                                                  'Add to cart',
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          10,
                                                                      color: widget
                                                                          .theme
                                                                          .mainAccent,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800),
                                                                ),
                                                              )),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                })),
                                              )),
                                        ),
                                      ]),
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
