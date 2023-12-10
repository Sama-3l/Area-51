// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

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
import '../../constants/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme.mainAccent,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: AspectRatio(
                aspectRatio: 5,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Area 51",
                        style: GoogleFonts.poppins(
                            fontSize: 31,
                            color: widget.theme.oppAccent,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic)))),
          ),
          Expanded(
              child: Stack(
            children: [
              Padding(
                  padding: productPagePadding,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 1.5, color: widget.theme.oppAccent),
                        bottom:
                            BorderSide(width: 0, color: widget.theme.oppAccent),
                        left: BorderSide(
                            width: 1.5, color: widget.theme.oppAccent),
                        right: BorderSide(
                            width: 1.5, color: widget.theme.oppAccent),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<CatalogBloc>(context).add(
                                          ShowCatalogEvent(widget.product));
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                                        size: 39,
                                        color: widget.theme.oppAccent)),
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
                            child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: widget.theme.productAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05,
                                  top: 20),
                              child: AutoSizeText(
                                widget.product.name,
                                minFontSize: 18,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    color: widget.theme.oppAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: AutoSizeText(
                                "\$${widget.product.price}",
                                minFontSize: 15,
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                    color:
                                        widget.theme.oppAccent.withOpacity(0.5),
                                    fontSize: 21),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: 30
                              ),
                              child: AutoSizeText(
                                widget.product.description,
                                minFontSize: 15,
                                style: GoogleFonts.poppins(
                                    color: widget.theme.oppAccent,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                    elevation: 1,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: widget.theme.oppAccent.withOpacity(0.25),
                              offset: Offset(0, -7),
                              blurRadius: 20)
                        ], color: widget.theme.mainAccent),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Price",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: widget.theme.oppAccent
                                                      .withOpacity(0.7))),
                                          Text('\$${widget.product.price}',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      widget.theme.oppAccent))
                                        ],
                                      ))),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: BlocBuilder<CartBloc, CartState>(
                                      builder: (context, state) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 8, right: 15),
                                          child: GestureDetector(
                                            onTap: () =>
                                                methods.buyButtonMethod(
                                                    widget.user,
                                                    context,
                                                    widget.product),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color:
                                                        widget.theme.oppAccent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                60))),
                                                child: Center(
                                                  child: Text(
                                                    'Add to cart',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: widget
                                                            .theme.mainAccent,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )),
                                          ),
                                        );
                                      },
                                    )),
                              ),
                            ]))),
              )
            ],
          ))
        ],
      ),
    );
  }
}
