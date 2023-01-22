import 'package:area_51/presentation/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc/bloc.dart';

import 'package:area_51/constants/colors.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.theme});

  LightMode theme;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme.mainAccent,
      body: Column(children: [
        Center(
            child: TextButton(
          onPressed: () {},
          child: Text("Area 51",
              style: GoogleFonts.poppins(
                  fontSize: 31,
                  color: widget.theme.oppAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic)),
        )),
        Expanded(child: ListView())
      ]),
    );
  }
}
