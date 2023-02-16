// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:area_51/business_logic/blocs/catalogBloc/catalog_bloc.dart';
import 'package:area_51/business_logic/cubits/themeCubit/theme_cubit.dart';
import 'package:area_51/data/models/product.dart';
import 'package:area_51/data/models/user.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/presentation/pages/productPage.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:area_51/constants/colors.dart';
import '../../data/repositories/products_Repo.dart';
import '../widgets/products/homePageProductItem.dart';

class Catalog extends StatefulWidget {
  Catalog(
      {super.key,
      required this.theme,
      required this.catalogProducts,
      required this.user});

  LightMode theme;
  ProductList catalogProducts;
  CurrentUser user;

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is ShowCatalogState)
          return CatalogListing(
              theme: widget.theme,
              cart: widget.user.cartProducts,
              catalogProducts: widget.catalogProducts);
        else if (state is ShowProductState) {
          return ProductPage(
              theme: widget.theme, product: state.product, user: widget.user);
        } else {
          return CatalogListing(
              theme: widget.theme,
              cart: widget.user.cartProducts,
              catalogProducts: widget.catalogProducts);
        }
      },
    );
  }
}

class CatalogListing extends StatelessWidget {
  CatalogListing(
      {super.key,
      required this.theme,
      required this.cart,
      required this.catalogProducts});

  LightMode theme;
  CartProducts cart;
  ProductList catalogProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.mainAccent,
        body: CustomScrollView(
          key: PageStorageKey<String>('products'),
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: theme.oppAccent,
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(height: 20),
                Container(color: Colors.black, height: 50),
              ]),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(left: 23, top: 50, bottom: 15),
                    child: AutoSizeText('Products',
                        maxFontSize: 24,
                        minFontSize: 17,
                        style: GoogleFonts.poppins(
                            color: theme.oppAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            SliverPadding(
              padding: const EdgeInsets.only(left: 20),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.65),
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    return index % 2 == 0
                        ? Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30, right: 2),
                            child: ProductItem(
                              index: index,
                              theme: theme,
                              dimensions: 190,
                              radius: 10,
                              product: catalogProducts.productList[index],
                              homeScreen: false,
                            ))
                        : Padding(
                            padding: const EdgeInsets.only(left: 2, bottom: 30),
                            child: ProductItem(
                              index: index,
                              theme: theme,
                              dimensions: 190,
                              radius: 10,
                              homeScreen: false,
                              product: catalogProducts.productList[index],
                            ));
                  }), childCount: catalogProducts.productList.length)),
            )
          ],
        ));
  }
}

/*class CatalogListing extends StatefulWidget {
  CatalogListing(
      {super.key, required this.theme, required this.catalogProducts});

  LightMode theme;
  ProductList catalogProducts;

  @override
  State<CatalogListing> createState() => _CatalogListingState();
}

class _CatalogListingState extends State<CatalogListing> {
  
  }
}*/

/*class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.theme.mainAccent,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              DefaultTabController.of(context)!.animateTo(2);
              BlocProvider.of<CartBloc>(context)
                  .add(ProductAddedEvent(cart: widget.cart));
            },
            child: Text('hello')),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: widget.theme.oppAccent,
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(height: 20),
                Container(color: Colors.black, height: 50),
              ]),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(left: 23, top: 50, bottom: 15),
                    child: AutoSizeText('Products',
                        maxFontSize: 24,
                        minFontSize: 17,
                        style: GoogleFonts.poppins(
                            color: widget.theme.oppAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final cart = state.cart;
                if (state is AddedToCartState) {
                  cart.cartProducts.add(Product(price: 999.9, name: "Hell"));
                } else if (state is RemovedFromCartState) {
                  cart.cartProducts.remove(Product(price: 999.9, name: "Hell"));
                }
                return SliverPadding(
                  padding: const EdgeInsets.only(left: 20),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.65),
                      delegate: SliverChildBuilderDelegate(((context, index) {
                        return index % 2 == 0
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 30, right: 2),
                                child: ProductItem(
                                  index: index,
                                  theme: widget.theme,
                                  dimensions: 190,
                                  radius: 10,
                                  product: widget.cart.cartProducts[index],
                                  homeScreen: false,
                                ))
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, bottom: 30),
                                child: ProductItem(
                                  index: index,
                                  theme: widget.theme,
                                  dimensions: 190,
                                  radius: 10,
                                  homeScreen: false,
                                  product: widget.cart.cartProducts[index],
                                ));
                      }), childCount: widget.cart.cartProducts.length)),
                );
              },
            ),
          ],
        ));
  }
}*/