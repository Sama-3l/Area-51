
import 'package:area_51/constants/colors.dart';
import 'package:area_51/presentation/pages/productPage.dart';
import 'package:area_51/presentation/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:area_51/data/models/product.dart';

class ProductItem extends StatelessWidget {
  ProductItem(
      {super.key,
      required this.theme,
      required this.index,
      required this.productTitle,
      required this.price,
      required this.homeScreen,
      required this.dimensions,
      required this.radius});

  LightMode theme;
  int index;
  String productTitle;
  double price;
  bool homeScreen;
  double dimensions;
  double radius;

  @override
  Widget build(BuildContext context) {
    return index == 0 && homeScreen
        ? Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ProductListing(
                theme: theme,
                radius: radius,
                dimensions: dimensions,
                productTitle: productTitle,
                price: price),
          )
        : ProductListing(
            theme: theme,
            radius: radius,
            dimensions: dimensions,
            productTitle: productTitle,
            price: price);
  }
}

class ProductListing extends StatelessWidget {
  const ProductListing({
    Key? key,
    required this.theme,
    required this.radius,
    required this.dimensions,
    required this.productTitle,
    required this.price,
  }) : super(key: key);

  final LightMode theme;
  final double radius;
  final double dimensions;
  final String productTitle;
  final double price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 13, bottom: 10),
            child: Container(
                decoration: BoxDecoration(
                    color: theme.productAccent,
                    borderRadius: BorderRadius.circular(radius)),
                height: dimensions,
                width: dimensions),
          ),
        ),
        SizedBox(
          width: dimensions,
          child: AutoSizeText(productTitle,
              maxFontSize: 15,
              minFontSize: 10,
              maxLines: 2,
              style: GoogleFonts.inter(
                  color: theme.oppAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        AutoSizeText("\$$price",
            maxFontSize: 12,
            minFontSize: 9,
            maxLines: 1,
            style: GoogleFonts.inter(
                fontSize: 12,
                color: theme.oppAccent.withOpacity(0.5),
                fontWeight: FontWeight.w400)),
      ]),
    );
  }
}