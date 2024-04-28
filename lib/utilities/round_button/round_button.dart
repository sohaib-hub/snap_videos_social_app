import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RoundButton extends StatelessWidget {
  String title;
  double?  title_size;
  double button_height,button_width;
 Color? background_color;
      Color? title_color;
  VoidCallback onpress;
   RoundButton({super.key,
  required this.title,
     this.title_color,
     this.title_size,
     required this.button_height,
     required this.button_width,
     this.background_color,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: button_height,
      width: button_width,

      child: ElevatedButton(onPressed:onpress,

          style: ElevatedButton.styleFrom(
              backgroundColor:background_color),
          child: Text(title,
            style: TextStyle(
                color: title_color,
                fontSize:title_size,
                fontWeight: FontWeight.bold
            ),)),
    );
  }
}
