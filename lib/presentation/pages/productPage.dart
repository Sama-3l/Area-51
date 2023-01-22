import 'package:flutter/material.dart';
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
    return Column(children: [
      Center(
          child: Text("Area 51",
              style: GoogleFonts.poppins(
                  fontSize: 31,
                  color: widget.theme.oppAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic))),
      ListView()
    ]);
  }
}
