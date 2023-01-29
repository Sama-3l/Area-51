import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CartButtons extends StatelessWidget {
  CartButtons(
      {super.key,
      required this.theme,
      required this.icon,
      required this.forAddition});

  LightMode theme;
  IconData icon;
  bool forAddition;

  @override
  Widget build(BuildContext context) {
    return forAddition
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: theme.mainAccent,
                    borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(icon, size: 13, color: theme.oppAccent),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                decoration: BoxDecoration(
                    color: theme.oppAccent,
                    borderRadius: BorderRadius.circular(60)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(icon, size: 13, color: theme.mainAccent),
                ),
              ),
            ),
          );
  }
}
