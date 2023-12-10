// ignore_for_file: prefer_const_constructors, overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

class LightMode{

  final Color mainAccent = Color(0xfff8f8f8);
  final Color oppAccent = Color(0xff121212);
  final Color productAccent = Color(0xffE5E5E5);
}

class DarkMode extends LightMode{
  final Color mainAccent = Color(0xff121212);
  final Color oppAccent = Color(0xfff8f8f8);
  final Color productAccent = Color(0xff282828);
}