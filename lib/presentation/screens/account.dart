// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:area_51/business_logic/cubits/themeCubit/theme_cubit.dart';
import 'package:area_51/constants/colors.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  Account({super.key, required this.state, required this.theme});

  ThemeState state;
  LightMode theme;

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AspectRatio(
          aspectRatio: 6,
          child: Center(
              child: Text("Area 51",
                  style: GoogleFonts.poppins(
                      fontSize: 31,
                      color: widget.theme.oppAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic)))),
      AspectRatio(
          aspectRatio: 2,
          child: Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Hello,",
                        style: GoogleFonts.poppins(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                            color: widget.theme.oppAccent)),
                    TextSpan(
                        text: "Siddhartha Mishra",
                        style: GoogleFonts.poppins(
                            fontSize: 23, color: widget.theme.oppAccent)),
                  ]))))),
      AspectRatio(
          aspectRatio: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Theme",
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold, color: widget.theme.oppAccent))),
              Padding(
                  padding: EdgeInsets.only(left: 45, right: 45, top: 30),
                  child: AspectRatio(
                      aspectRatio: 4.8,
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ThemeCubit>(context).changeTheme(); 
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: widget.theme.oppAccent, width: 2),
                                  borderRadius: BorderRadius.circular(60))),
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(
                                widget.state.themeIsLight
                                    ? CarbonIcons.asleep_filled
                                    : CarbonIcons.awake,
                                color: widget.theme.oppAccent,
                                size: 35,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text(
                                    widget.state.themeIsLight
                                        ? "Dark Mode"
                                        : "Light Mode",
                                    style: GoogleFonts.poppins(
                                        color: widget.theme.oppAccent,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Spacer()
                            ],
                          )))),
            ],
          ))
    ]);
  }
}
