// ignore_for_file: prefer_const_constructors, overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

class LightMode{

  final Color mainAccent = Color(0xffffffff);
  final Color oppAccent = Color(0xff000000);
  final Color productAccent = Color(0xffE5E5E5);
}

class DarkMode extends LightMode{
  final Color mainAccent = Color(0xff000000);
  final Color oppAccent = Color(0xffffffff);
  final Color productAccent = Color(0xff282828);
}