import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:area_51/data/repositories/wishlist_products.dart';

class CurrentUser {
  String username;
  CartProducts cartProducts;
  WishlistProducts wishListProducts;
  LightMode theme;

  CurrentUser(
      {required this.username,
      required this.cartProducts,
      required this.wishListProducts,
      required this.theme});
}
