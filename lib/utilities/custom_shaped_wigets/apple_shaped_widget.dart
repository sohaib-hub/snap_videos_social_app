import 'package:flutter/material.dart';
import 'dart:math';

import 'package:recrutment_task/resources/appimages.dart';
import 'package:recrutment_task/view_model/welcom_view_model/welcom_view_model.dart';



class AppleShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Define apple shape using bezier curves
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.cubicTo(
        size.width * 0.2, size.height * 0.1,
        size.width * 0.1, size.height * 0.35,
        size.width * 0.2, size.height * 0.45
    );
    path.cubicTo(
        size.width * 0.05, size.height * 0.6,
        size.width * 0.05, size.height * 0.8,
        size.width * 0.2, size.height * 0.9
    );
    path.cubicTo(
        size.width * 0.4, size.height * 0.97,
        size.width * 0.6, size.height * 0.97,
        size.width * 0.8, size.height * 0.9
    );
    path.cubicTo(
        size.width * 0.95, size.height * 0.8,
        size.width * 0.95, size.height * 0.6,
        size.width * 0.8, size.height * 0.45
    );
    path.cubicTo(
        size.width * 0.7, size.height * 0.35,
        size.width * 0.6, size.height * 0.1,
        size.width * 0.5, size.height * 0.1
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
WelcomviewModel welcomviewModel=WelcomviewModel();


class AppleShapeContainer extends StatelessWidget {
   int requiredindex;
  @override


  // Constructor with required variable
  AppleShapeContainer({ required this.requiredindex});
   final  item=welcomviewModel.welcomslider_list.toList();
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppleShapeClipper(),
      child: Container(
        width: 200, // Adjust as needed
        height: 300, // Adjust as needed
        child: Image.asset(item[requiredindex].image,
          //AppImages.user_profile, // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

