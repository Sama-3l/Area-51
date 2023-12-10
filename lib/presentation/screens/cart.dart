// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/models/user.dart';
import 'package:area_51/presentation/widgets/cartWidgets/cartOut.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/blocs/cartBloc/cart_bloc.dart';
import '../widgets/cartWidgets/cartButtons.dart';

class Cart extends StatefulWidget {
  Cart({super.key, required this.theme, required this.user});

  LightMode theme;
  CurrentUser user;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    if (widget.user.cartProducts.cartProducts.isNotEmpty) {
      BlocProvider.of<CartBloc>(context).add(
          AddToCartEvent(cartProducts: widget.user.cartProducts.cartProducts));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
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
                        itemCount: widget.user.cartProducts.cartProducts.length,
                        itemBuilder: ((context, index) {
                          return CartListings(
                              theme: widget.theme,
                              productListing:
                                  widget.user.cartProducts.cartProducts[index],
                              productCartIndex: index,
                              user: widget.user);
                        }));
                  } else if (state is CartInitial ||
                      state is RemovedFromCartState) {
                    return Align(
                      alignment: Alignment(0, -0.3),
                      child: Text("No Products In The Cart",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: widget.theme.oppAccent,
                              fontWeight: FontWeight.bold)),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: widget.user.cartProducts.cartProducts.length,
                        itemBuilder: ((context, index) {
                          return CartListings(
                            theme: widget.theme,
                            productListing:
                                widget.user.cartProducts.cartProducts[index],
                            productCartIndex: index,
                            user: widget.user,
                          );
                        }));
                  }
                },
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return CartPayment(
                    theme: widget.theme,
                    cartProducts: widget.user.cartProducts);
              },
            ))
      ],
    );
  }
}

class CartListings extends StatefulWidget {
  CartListings(
      {super.key,
      required this.theme,
      required this.productListing,
      required this.productCartIndex,
      required this.user});

  LightMode theme;
  Map productListing;
  int productCartIndex;
  CurrentUser user;

  @override
  State<CartListings> createState() => _CartListingsState();
}

class _CartListingsState extends State<CartListings> {
  String addingZeroToCount(int count) {
    if (count < 10) {
      return "0$count";
    } else {
      return "$count";
    }
  }

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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      height: constraints.maxWidth * 0.9,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            AutoSizeText(widget.productListing['name'].name,
                                maxFontSize: 15,
                                minFontSize: 10,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: widget.theme.oppAccent,
                                    fontWeight: FontWeight.bold)),
                            AutoSizeText(
                                "\$${widget.productListing['name'].price}",
                                maxFontSize: 13,
                                minFontSize: 8,
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: widget.theme.oppAccent
                                        .withOpacity(0.7))),
                            Spacer(flex: 3)
                          ]),
                    );
                  },
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.115,
                    width: 37,
                    decoration: BoxDecoration(
                        color: widget.theme.productAccent,
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                    child: Column(
                      children: [
                        CartButtons(
                          theme: widget.theme,
                          icon: Icons.add,
                          forAddition: true,
                          product: widget.productListing['name'],
                          productCartIndex: widget.productCartIndex,
                          user: widget.user,
                        ),
                        Spacer(),
                        Text(addingZeroToCount(widget.productListing['count']),
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: widget.theme.oppAccent,
                                fontWeight: FontWeight.w300)),
                        Spacer(),
                        CartButtons(
                            theme: widget.theme,
                            icon: Icons.remove,
                            forAddition: false,
                            product: widget.productListing['name'],
                            productCartIndex: widget.productCartIndex,
                            user: widget.user)
                      ],
                    )),
              )
            ],
          );
        })));
  }
}
