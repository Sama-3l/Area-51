// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, must_be_immutable

import 'package:area_51/business_logic/blocs/catalogBloc/catalog_bloc.dart';
import 'package:area_51/data/models/user.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/presentation/pages/productPage.dart';
import 'package:area_51/presentation/widgets/searchWidgets/searchBar.dart';
import 'package:area_51/presentation/widgets/searchWidgets/search_buttons.dart';
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
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.mainAccent,
        body: CustomScrollView(
          key: PageStorageKey<String>('products'),
          slivers: [
            SliverAppBar(
                pinned: true,
                backgroundColor: theme.mainAccent,
                stretch: true,
                toolbarHeight: 115,
                title: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: AppSearchBar(
                      text: "Enter",
                      txt: search,
                      error: false,
                      theme: theme,
                      fontSize: 20),
                )),
            SliverToBoxAdapter(
                child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Row(children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: SearchButtons(
                      buttonText: "Filter", filterButton: true, theme: theme),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: SearchButtons(
                      buttonText: "Sort", filterButton: false, theme: theme),
                ))
              ]),
            )),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(left: 23, top: 25, bottom: 15),
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
            ),
          ],
        ));
  }
}
