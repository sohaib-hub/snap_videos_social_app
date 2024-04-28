
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:recrutment_task/model/pageSlider_model/PageSliderModel.dart';

import '../../resources/appimages.dart';


class WelcomviewModel extends GetxController{

  RxList<PagesliderModel>welcomslider_list=[
    PagesliderModel(
      AppImages.user1,
      'Discover Greate Deals',
      'Have something to sell? Just snap, upload, and price your items. We\'ve made the simple and quick .Get your items in front of buyers in no time!',
    ),
    PagesliderModel(
      AppImages.user2,
        'Effortless Selling',
      'Have something to sell? Just snap, upload, and price your items. We\'ve made the simple and quick .Get your items in front of buyers in no time!',
    ),
    PagesliderModel(
       // Appanimation.shoping_anim,
      AppImages.user3,
        'Promote Your Business ',
      'Our platform is powerful tool for business as well! Advertise your  products or services to large and engauged audiences',

    ),

  ].obs;

  RxInt selectedbuttonindex=2.obs;
  void selectedbutton(int index){

      selectedbuttonindex.value=index;

  }
  Color gradientToColor(Gradient gradient) {
    final shader = gradient.createShader(Rect.fromLTWH(1, 10, 50, 60));
    return gradient.colors.first; // You can change this to another color from the gradient
  }

}

