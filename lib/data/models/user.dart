import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/data/repositories/wishlist_products.dart';

class CurrentUser {
  String username;
  CartProducts cartProducts;
  WishlistProducts wishListProducts;

  CurrentUser(
      {required this.username,
      required this.cartProducts,
      required this.wishListProducts});

  Map toJson() => {
    'name' : username,
    'cart' : cartProducts.cartProducts,
    'wishlist' : wishListProducts.wishlist
  };
}
