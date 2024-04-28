import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recrutment_task/resources/appimages.dart';

import '../welcome_view/welcome_view.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState() ;
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{
  @override
 // late AnimationController _animationController;
  void initState() {
    // TODO: implement initState
    super.initState();
    /*_animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );
    _animationController.forward();*/

      Future.delayed(Duration(seconds: 5), () {
        Get.to(()=>WelcomeView());
      });
    }



  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Appcolors.background_color,
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.splash_background,),fit: BoxFit.cover)
        ),
      ),

    );
  }
}
