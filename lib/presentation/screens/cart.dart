import 'package:area_51/business_logic/cubits/cartCubit/cart_cubit.dart';
import 'package:area_51/constants/colors.dart';
import 'package:area_51/data/repositories/cart_Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  Cart({super.key, required this.theme});

  LightMode theme;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartProducts cart = CartProducts();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: cart.cartProducts.length,
            itemBuilder: ((context, index) {
              return Text(cart.cartProducts[index].name,
                  style:
                      GoogleFonts.poppins(fontSize: 24, color: Colors.black));
            }));
      },
    );
  }
}
