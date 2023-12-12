// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:area_51/constants/colors.dart';
import 'package:area_51/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class AppSearchBar extends StatefulWidget {
  AppSearchBar(
      {super.key,
      required this.text,
      required this.txt,
      required this.error,
      this.opacity = true,
      this.opacityValue = 0.8,
      this.borderColorBlack = false,
      this.autofocus = false,
      this.fontSize = 20,
      required this.theme});

  String text;
  TextEditingController txt;
  bool error;
  bool opacity;
  double opacityValue;
  bool borderColorBlack;
  double fontSize;
  bool autofocus;
  LightMode theme;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.error
                    ? Colors.red
                    : widget.borderColorBlack
                        ? widget.theme.mainAccent
                        : widget.theme.oppAccent),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          autofocus: widget.autofocus,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: widget.txt,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: widget.theme.oppAccent,
          style: GoogleFonts.spaceGrotesk(
              color: widget.borderColorBlack
                  ? widget.theme.mainAccent
                  : widget.theme.oppAccent,
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
              fontSize: widget.fontSize),
          decoration: InputDecoration(
              hintText: widget.text,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child:
                    Iconify(search_button, color: widget.theme.oppAccent),
              ),
              hintStyle: GoogleFonts.spaceGrotesk(
                  color: widget.opacity
                      ? widget.theme.oppAccent.withOpacity(widget.opacityValue)
                      : widget.theme.oppAccent,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                  fontSize: widget.fontSize),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              errorText: widget.error ? "Check Input" : null,
              errorStyle: GoogleFonts.inter(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.fontSize)),
        ));
  }
}
