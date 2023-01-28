// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/blocs/cartBloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  Cart({super.key, required this.theme, required this.cart});

  LightMode theme;
  CartProducts cart;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 65, bottom: 85),
          child: Text("Your Cart",
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: widget.theme.oppAccent,
                  fontWeight: FontWeight.bold)),
        )),
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is AddedToCartState) {
                return ListView.builder(
                    itemCount: widget.cart.cartProducts.length,
                    itemBuilder: ((context, index) {
                      return CartListings(
                          theme: widget.theme,
                          productListing: widget.cart.cartProducts[index]);
                    }));
              } else {
                return ListView.builder(
                    itemCount: widget.cart.cartProducts.length,
                    itemBuilder: ((context, index) {
                      return CartListings(
                          theme: widget.theme,
                          productListing: widget.cart.cartProducts[index]);
                    }));
              }
            },
          ),
        ),
      ],
    );
  }
}

class CartListings extends StatefulWidget {
  CartListings({super.key, required this.theme, required this.productListing});

  LightMode theme;
  Map productListing;

  @override
  State<CartListings> createState() => _CartListingsState();
}

class _CartListingsState extends State<CartListings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 20),
        child: LayoutBuilder(builder: ((context, constraints) {
          return Row(
            children: [
              Flexible(
                  child: Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.height * 0.14,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                          color: widget.theme.productAccent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.productListing['name'].name,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: widget.theme.oppAccent,
                                fontWeight: FontWeight.bold)),
                        Text("\$${widget.productListing['name'].price}",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                color:
                                    widget.theme.oppAccent.withOpacity(0.5))),
                      ]),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 56),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: 30,
                  decoration: BoxDecoration(
                      color: widget.theme.productAccent,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                ),
              )
            ],
          );
        })));
  }
}
