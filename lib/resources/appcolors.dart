import 'dart:ui';

import 'package:flutter/material.dart';

class Appcolors {
  static Color background_color = Color(0xFFFFFFFF);
  static Color primary_color1 = Color(0xFF1B5E20);
  static Color primary_color =Color(0xFF01579B);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color red = Colors.red;
  static Color green= Colors.greenAccent;
  static Color grey = Color(0xFFBDBDBD);
  static Color amber = Colors.amber;
 /* static Color grad = Colors.gradientToColor(
      LinearGradient(
        colors: [Colors.green, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )
  ) ;*/


  Color gradientToColor(Gradient gradient) {
    final shader = gradient.createShader(Rect.fromLTWH(0, 0, 200, 200));
    return gradient.colors.first; // You can change this to another color from the gradient
  }
}
