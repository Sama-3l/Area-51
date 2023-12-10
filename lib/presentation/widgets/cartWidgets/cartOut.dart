// ignore_for_file: prefer_const_constructors

import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:area_51/constants/icons.dart';

class CartPayment extends StatefulWidget {
  const CartPayment(
      {super.key, required this.theme, required this.cartProducts});

  final LightMode theme;
  final CartProducts cartProducts;

  @override
  State<CartPayment> createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
  double price = 0;

  void setPrice() {
    price = 0;
    for (int i = 0; i < widget.cartProducts.cartProducts.length; i++) {
      price += (widget.cartProducts.cartProducts[i]['name'].price *
          widget.cartProducts.cartProducts[i]['count']);
    }
  }

  @override
  Widget build(BuildContext context) {
    setPrice();
    return LayoutBuilder(builder: ((context, constraints) {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            elevation: 1,
            child: Container(
              height: constraints.maxHeight * 0.075,
              width: constraints.maxWidth,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: widget.theme.oppAccent.withOpacity(0.25),
                    offset: const Offset(0, -7),
                    blurRadius: 20)
              ], color: widget.theme.mainAccent),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color:
                                    widget.theme.oppAccent.withOpacity(0.7))),
                        Text('\$${price.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: widget.theme.oppAccent))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: LayoutBuilder(builder: ((context, constraints) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8, right: 15),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.1,
                                decoration: BoxDecoration(
                                    color: widget.theme.oppAccent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(60))),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Text(
                                          'Payment Options',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: widget.theme.mainAccent,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      Iconify(forward),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }))),
                ),
              ]),
            ),
          ));
    }));
  }
}
