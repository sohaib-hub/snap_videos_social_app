
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recrutment_task/utilities/custom_shaped_wigets/apple_shaped_widget.dart';
import 'package:recrutment_task/utilities/round_button/round_button.dart';
import '../../resources/appcolors.dart';
import '../../view_model/welcom_view_model/welcom_view_model.dart';
import '../video_post_view/video_post_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  PageController _pageController=PageController();
   int currentpage=1;
  WelcomviewModel welcomviewModel=WelcomviewModel();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
        Expanded(
          flex: 100,
          child: PageView.builder(
            controller: _pageController,
              itemCount: welcomviewModel.welcomslider_list.length,
              onPageChanged: (value){
              setState(() {
                currentpage=value;
              });
              },
              itemBuilder: (context,index)

              {
                final item=welcomviewModel.welcomslider_list[index];
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                 height: Get.height*0.60,
                 color: Appcolors.primary_color.withOpacity(0.5),
                  child: AppleShapeContainer(requiredindex: index,)
               ),
                Expanded(
                  child: Container(
                    color: Appcolors.primary_color.withOpacity(0.8),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height*0.06,
                      ),

                      Text(item.title,
                        maxLines: 1,
                        style: Theme.of(context).
                        textTheme.headlineMedium!.copyWith(
                          color: Appcolors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Get.height*0.02),

                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(item.descripton,
                          maxLines: 3,
                          style: Theme.of(context).
                          textTheme.bodyMedium!.copyWith(
                            color: Appcolors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height*0.04),
                      Padding(

                        padding:EdgeInsets.symmetric(horizontal: 140),
                        child: Row(
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right:5.0),
                              child: AnimatedContainer(
                                duration: const Duration(microseconds: 150),
                                height:Get.height*0.01,
                                width: Get.width*0.02,
                                decoration: BoxDecoration(
                                  color: currentpage==index? Appcolors.green:Appcolors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: Get.height*0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(() => RoundButton(
                              title: 'Skip',
                              button_height: Get.height*0.06,
                              button_width: Get.width*0.4,
                              background_color: welcomviewModel.selectedbuttonindex.value==1?
                              welcomviewModel.gradientToColor(
                              const   LinearGradient(
                                  colors: [Colors.blue, Colors.white,Colors.blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              )
                                  :Appcolors.background_color,

                              title_color: welcomviewModel.selectedbuttonindex.value==1?Appcolors.white:Appcolors.primary_color,
                              onpress:(){
                                welcomviewModel.selectedbutton(1);
                                Get.to(MainView());
                          })),
                          Obx(() =>RoundButton(
                              title: currentpage!=welcomviewModel.welcomslider_list.length-1?'Next':'Explore',
                              button_height: Get.height*0.06,
                              button_width: Get.width*0.4,
                            background_color:
                            welcomviewModel.selectedbuttonindex.value==2?
                            welcomviewModel.gradientToColor(
              const LinearGradient(
              colors: [Colors.greenAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
                            ):
                            Appcolors.background_color,
                            title_color: welcomviewModel.selectedbuttonindex.value==2?Appcolors.white:Appcolors.primary_color,
                            onpress: (){  welcomviewModel.selectedbutton(2);
                              if(currentpage<welcomviewModel.welcomslider_list.length-1){
                                _pageController.nextPage(
                                    duration: const Duration(
                                        microseconds: 300
                                    ),
                                    curve: Curves.easeOut
                                );
                              }
                              else if(currentpage!=welcomviewModel.welcomslider_list.length)
                              {
                                setState(() {

                                });
                                Get.to(MainView());
                              }
                            },
                          ))
                        ],
                      )
                    ],
                  ),
                  ),
                ),

              ],
            );
          }),
        )
                ],
              ),
      ),

    );
  }
}
