import 'package:area_51/data/models/product.dart';
import 'package:area_51/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/blocs/cartBloc/cart_bloc.dart';

class Methods {
  Map<String, dynamic> encode(Product product) {
    return {
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'id': product.productId
    };
  }

  List<Map> cartEntry(List<Map> cartProducts) {
    List<Map> list = [];
    for (int i = 0; i < cartProducts.length; i++) {
      list.add({
        'name': encode(cartProducts[i]['name']),
        'count': cartProducts[i]['count']
      });
    }
    return list;
  }

  Map<dynamic, dynamic> initializeObject(Map product) {
    return {
      'name': Product(
          price: product['name']['price'],
          description: product['name']['description'],
          name: product['name']['name'],
          productId: product['name']['id']),
      'count': product['count'],
    };
  }

  void buyButtonMethod(CurrentUser user, BuildContext context, Product product) {
    bool productExists = false;
    int productIndex = 0;
    for (int i = 0; i < user.cartProducts.cartProducts.length; i++) {
      if (product.productId ==
          user.cartProducts.cartProducts[i]['name'].productId) {
        productExists = true;
        productIndex = i;
      }
    }
    DefaultTabController.of(context).animateTo(2);
    if (!productExists) {
      final Map addToCart = {
        "name": product,
        "count": 1,
      };
      user.cartProducts.cartProducts.add(addToCart);
    } else {
      user.cartProducts.cartProducts[productIndex]['count'] =
          user.cartProducts.cartProducts[productIndex]['count'] + 1;
    }
    BlocProvider.of<CartBloc>(context).add(
        AddToCartEvent(cartProducts: user.cartProducts.cartProducts));
  }

  void increment(BuildContext context, CurrentUser user, int productCartIndex) async {
    user.cartProducts.cartProducts[productCartIndex]['count'] =
        user.cartProducts.cartProducts[productCartIndex]['count'] + 1;
  }

  void decrement(BuildContext context, CurrentUser user, int productCartIndex) {
    user.cartProducts.cartProducts[productCartIndex]['count'] =
        user.cartProducts.cartProducts[productCartIndex]['count'] - 1;
    if (user.cartProducts.cartProducts[productCartIndex]['count'] == 0) {
      user.cartProducts.cartProducts.removeAt(productCartIndex);
    }
    if (user.cartProducts.cartProducts.isEmpty) {
      BlocProvider.of<CartBloc>(context)
          .add(RemoveFromCartEvent(cartProducts: []));
    } else {
      BlocProvider.of<CartBloc>(context)
          .add(AddToCartEvent(cartProducts: user.cartProducts.cartProducts));
    }
  }
}
