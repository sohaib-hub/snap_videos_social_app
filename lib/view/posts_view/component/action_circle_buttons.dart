import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ActionCircleButton extends StatelessWidget {
  final Icon? icon;
  final Color? con_color;
  final String? profile_image;
  //final Color? border_color;
  final Color? icon_color;
  final Color? lable_color;
  final String? lable;
  const ActionCircleButton({super.key,
    this.icon,
    this.profile_image,
    this.con_color,
   // this.border_color,
    this.icon_color,
    this.lable,
    this.lable_color,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: Get.height*0.07,
          width: Get.height*0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(profile_image.toString()),fit: BoxFit.fill),
            gradient:  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlueAccent,
                Colors.greenAccent,
               // Colors.greenAccent,
              ],
            ),
            /*border: Border.all(
                color:border_color!,width: 2.5),*/

            //borderRadius: BorderRadius.circular(100),
          //  color:con_color,
          ),
          child:
          Icon(icon?.icon,color: icon_color,),

        ) ,
        Text(lable.toString(),style: TextStyle(color: lable_color,fontSize: 14,fontWeight: FontWeight.bold),),

      ],
    );

  }
}
