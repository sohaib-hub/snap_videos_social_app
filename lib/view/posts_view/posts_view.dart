

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recrutment_task/model/apiModel/postsapi_model.dart';
import 'package:recrutment_task/view_model/posts_view_model/posts_view_model.dart';

import '../../resources/appcolors.dart';
import '../../resources/appicons.dart';
import '../../resources/appimages.dart';
import '../../utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'component/action_circle_buttons.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}
PostsApiModel postsApiModel=PostsApiModel();
PostsviewModel postsviewModel=PostsviewModel();
class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postsviewModel = PostsviewModel();
    postsApiModel = PostsApiModel();
    setState(() {

      postsviewModel.fetchPosts();
      postsviewModel.rxList.value;
    });
  }
  PageController _pageController=PageController();
  @override
  Widget build(BuildContext context) {

    setState(() {
      postsviewModel.fetchPosts();
      postsviewModel.postslist;
      postsviewModel.rxList.value;

    });
    print('rxlistt${postsviewModel.rxList.value}'+postsviewModel.rxList.length.toString());
    return
      Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        backgroundColor: Appcolors.primary_color.withOpacity(0.03),
        floatingActionButton:  Padding(
          padding: const EdgeInsets.fromLTRB(8.0,5,0,0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Get.height*0.09,
                      width: Get.width*0.14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1,color: Appcolors.green)

                      ),
                      child: Icon(AppIcons.add,color: Appcolors.white,size: 23,),
                    ),

                  ],
                ),
SizedBox(width: Get.width*0.04,),
                Column(
                children: [
            Container(
            height: Get.height*0.09,
              width: Get.width*0.14,
              decoration: BoxDecoration(
                 // image: DecorationImage(image:  AssetImage(AppImages.search),),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1,color: Appcolors.green)

              ),
              child: Icon(AppIcons.search,color: Appcolors.white),
            ),
            SizedBox(height:1),
              Text('Search',style: TextStyle(color: Appcolors.white,fontSize: 11),),


              ],
            ),SizedBox(width: Get.width*0.04,),
                Column(
                  children: [
                    Container(
                      height: Get.height*0.09,
                      width: Get.width*0.14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1,color: Appcolors.green)

                      ),
                      child: Icon(AppIcons.notification,color: Appcolors.white,),
                    ),
                    SizedBox(height:1),
                    Text('Notification',style: TextStyle(color: Appcolors.white,fontSize: 11),),


                  ],
                ),SizedBox(width: Get.width*0.04,),
                Column(
                children: [
            Container(
            height: Get.height*0.09,
              width: Get.width*0.14,
              decoration: BoxDecoration(
                  image: DecorationImage(image:  AssetImage(AppImages.electronic),),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1,color: Appcolors.green)

              ),
            ),
            SizedBox(height:1),
              Text('Electronic',style: TextStyle(color: Appcolors.white,fontSize: 11),),


              ],
            ),SizedBox(width: Get.width*0.04,),
                Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            Container(
            height: Get.height*0.09,
              width: Get.width*0.14,
              decoration: BoxDecoration(
                  image: DecorationImage(image:  AssetImage(AppImages.mahines),),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1,color: Appcolors.green)

              ),
            ),
            SizedBox(height:1),
              Text('Appliences',style: TextStyle(color: Appcolors.white,fontSize: 11),),


              ],
            ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child:
      /*    ListView.builder(

              controller: _pageController2,
              itemCount: 2,
              scrollDirection: Axis.horizontal,
             *//* onPageChanged: (value){
                setState(() {

                });
              },*//*
              itemBuilder: (contex,outerindex){

*/
                Obx(() => Expanded(
                      flex: 100,
                      child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: postsviewModel.rxList.value.length,
            itemBuilder: (context, index) {
              print( postsviewModel.rxList.value.length,);
              print("urllll"+postsviewModel.rxList[index].posts![index].postVideo.toString());
              return
                Expanded(
                  flex: 100,
                  child: Stack(
                    children: [
                      Container(

                        height: Get.height,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Appcolors.amber.withOpacity(0.02),
                        ),
                      ),
                      Positioned(
                          height: Get.height,
                          width: Get.width,

                          //child: Image.network(postsviewModel.postslist[index].profileImage.toString(),
                          child:
                          Obx(() =>Image.network(postsviewModel.rxList.value[index].posts![index].images![0].image.toString(),
                            fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print("pic"+postsviewModel.rxList.value[index].posts![index].images![0].image.toString());
                            // Replace this URL with the URL of your default image
                            return Image.network(postsviewModel.rxList.value[index].posts![index].profileImage.toString(),
                            fit: BoxFit.cover,);

                          },
                          )),


                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 12.0,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ActionCircleButton(
                            icon: Icon(AppIcons.offer),
                            icon_color: Appcolors.white,
                          //  lable: postsviewModel.postslist[index].offers.toString(),
                            lable: postsviewModel.rxList.value[index].posts![index].offers.toString(),
                            lable_color: Appcolors.white,
                          ),
                          SizedBox(height: Get.height * 0.01),
                          ActionCircleButton(
                            icon: Icon(AppIcons.heart),
                            icon_color: Appcolors.red,
                            con_color: Colors.transparent,
                            lable: postsviewModel.rxList.value[index].posts![index].likes.toString(),
                           // lable: postsviewModel.postslist[index].likes.toString(),
                            lable_color: Appcolors.white,
                          ),
                          SizedBox(height: Get.height * 0.01),
                          ActionCircleButton(
                            icon: Icon(AppIcons.chat),
                            icon_color: Appcolors.white,
                            con_color: Colors.transparent,
                            lable: postsviewModel.rxList.value[index].posts![index].comments.toString(),
                           // lable: postsviewModel.postslist[index].comments.toString(),
                            lable_color: Appcolors.white,
                          ),
                          SizedBox(height: Get.height * 0.01),
                          ActionCircleButton(
                            icon: Icon(AppIcons.share),
                            icon_color: Appcolors.white,
                            con_color: Colors.transparent,
                            //lable: postsviewModel.postslist[index].shares.toString(),
                            lable: postsviewModel.rxList.value[index].posts![index].shares.toString(),
                            lable_color: Appcolors.white,
                          ),
                          SizedBox(height: Get.height * 0.01),
                          CircleAvatar(
                            radius: 26,
                            child: CircleAvatar(
                              radius: 25,
                              //backgroundImage:NetworkImage(postsviewModel.postslist[index].profileImage.toString()),
                              backgroundImage:NetworkImage(postsviewModel.rxList.value[index].posts![index].profileImage.toString()),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.01),
                        ],
                      ),),
                      Positioned(
                        bottom: Get.height*0.19,
                        left: 12.0,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postsviewModel.rxList.value[index].posts![index].postTitle.toString(),
                          //  Text(postsviewModel.postslist[index].postTitle.toString(),
                              maxLines: 1,
                              style: TextStyle(color: Appcolors.white,fontWeight:FontWeight.bold,fontSize: 20),
                            ),
                            Text("ADE "+postsviewModel.rxList.value[index].posts![index].countryId.toString(),
                           // Text("ADE "+postsviewModel.postslist[index].countryId.toString(),
                              maxLines: 1,
                              style: TextStyle(color: Appcolors.amber,fontWeight:FontWeight.bold,fontSize: 20),
                            ),
                          ],
                        )
                      ),

                      Positioned(
                        left: 8,

                        bottom: Get.height*0.12,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,0,0,6),
                          child: Row(
                            children: [
                              ClipRRect(

                                borderRadius:BorderRadius.circular(25),
                                child: Container(
                                  height: Get.height*0.06,
                                  width: Get.width*0.12,
                                  decoration: BoxDecoration(
                                     //shape: BoxShape.circle,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                 child:
                                 /*Image.network(
                                   postsviewModel.postslist[index].flag.toString(),
                                   fit: BoxFit.cover,
                                 )*/
                                Image.asset(AppImages.flage_image,fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(width: Get.width*0.01,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(postsviewModel.rxList.value[index].posts![index].country.toString(),
                                 // Text(postsviewModel.postslist[index].country.toString(),
                                  maxLines: 1,
                                  style: TextStyle(color: Appcolors.white,fontSize: 18),
                                  ),
                                  //Text(postsviewModel.postslist[index].hashtagTitles.toString(),
                                  Text(postsviewModel.rxList.value[index].posts![index].hashtagTitles.toString(),
                                    maxLines: 1,
                                    style: TextStyle(color: Appcolors.white,fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                      Positioned(
                        left: 12,

                        bottom: Get.height*0.04,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: Get.height*0.07,
                            width: Get.width*0.42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors:[
                                    Colors.blueAccent,

                                    Colors.greenAccent
                                  ])
                            ),
                            child: Text(
                              // Add your post details here
                              'Vist Website',
                              style: TextStyle(
                                color: Appcolors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        right: 0,
                        bottom: Get.height*0.01,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: List.generate(6, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                child: AnimatedContainer(
                                  duration: const Duration(microseconds: 150),
                                  height:Get.height*0.01,
                                  width:0==index?Get.width*0.06:Get.width*0.02,
                                  decoration: BoxDecoration(
                                    color:

                                    0==index? Appcolors.amber:Appcolors.white,

                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),

                    ],
                  ),
                );

            }),
                    ),
                  )
          //  })
  ),
 bottomNavigationBar: BottomNavBar(initialindex: 2.obs,),
    );
  }
}
