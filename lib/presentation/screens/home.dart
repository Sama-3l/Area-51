// ignore_for_file: prefer_const_constructors

import 'package:area_51/business_logic/cubits/themeCubit/theme_cubit.dart';
import 'package:area_51/constants/colors.dart';
import 'package:area_51/presentation/widgets/homeScreenLists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.theme});

  LightMode theme;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
            aspectRatio: 12 / 3,
            child: Center(
              child: Text("Area 51",
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: widget.theme.oppAccent,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic)),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: AspectRatio(
            aspectRatio: 1.12,
            child: HomeScreenLists(
              theme: widget.theme,
              title: "New Arrival",
            )),
      ),
      AspectRatio(
        aspectRatio: 1.1,
        child: HomeScreenLists(
          theme: widget.theme,
          title: "Recommendation",
        ),
      ),
    ]);
  }
}
