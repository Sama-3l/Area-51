// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:area_51/constants/colors.dart';
import 'package:area_51/constants/icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class SearchButtons extends StatefulWidget {
  SearchButtons(
      {super.key,
      required this.buttonText,
      required this.filterButton,
      required this.theme});

  String buttonText;
  bool filterButton;
  LightMode theme;

  @override
  State<SearchButtons> createState() => _SearchButtonsState();
}

class _SearchButtonsState extends State<SearchButtons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.theme.oppAccent.withOpacity(0.08),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: widget.theme.oppAccent))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: AutoSizeText(widget.buttonText,
                  style: GoogleFonts.poppins(fontSize: 16, color: widget.theme.oppAccent)),
            ),
            widget.filterButton
                ? Iconify(filter_icon, size: 16, color: widget.theme.oppAccent)
                : Iconify(sort_icon, size: 16, color: widget.theme.oppAccent)
          ],
        ));
  }
}
