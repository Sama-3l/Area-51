// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:area_51/business_logic/cubits/themeCubit/theme_cubit.dart';
import 'package:area_51/constants/colors.dart';
import 'package:area_51/constants/icons.dart';
import 'package:area_51/data/models/user.dart';
import 'package:area_51/data/repositories/products_Repo.dart';
import 'package:area_51/presentation/widgets/homeWidgets/homeScreenLists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class Account extends StatefulWidget {
  Account(
      {super.key,
      required this.state,
      required this.theme,
      required this.user});

  ThemeState state;
  LightMode theme;
  CurrentUser user;

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
              alignment: Alignment(0, 0),
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
              ])))),
      AspectRatio(
          aspectRatio: 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Theme",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: widget.theme.oppAccent))),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      top: 20),
                  child: AspectRatio(
                      aspectRatio: 5.2,
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ThemeCubit>(context).changeTheme();
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: widget.theme.oppAccent,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: widget.theme.mainAccent, width: 2),
                                  borderRadius: BorderRadius.circular(60))),
                          child: Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: !widget.state.themeIsLight
                                    ? Iconify(light_Mode,
                                        size: 30,
                                        color: widget.theme.mainAccent)
                                    : Iconify(dark_Mode,
                                        size: 30,
                                        color: widget.theme.mainAccent),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text(
                                    widget.state.themeIsLight
                                        ? "Dark Mode"
                                        : "Light Mode",
                                    style: GoogleFonts.poppins(
                                        color: widget.theme.mainAccent,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Spacer()
                            ],
                          )))),
            ],
          )),
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Wishlist",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: widget.theme.oppAccent)),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text("More",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: widget.theme.oppAccent)),
                      Iconify(ios_forward,
                          color: widget.theme.oppAccent, size: 20)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: HomeScreenLists(
            theme: widget.theme,
            title: "Recommendation",
            removeTitle: true,
            products: ProductList(),
          ),
        ),
      ),
    ]);
  }
}
