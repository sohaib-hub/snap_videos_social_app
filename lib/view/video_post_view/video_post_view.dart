


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:recrutment_task/model/apiModel/postsapi_model.dart';
import 'package:recrutment_task/resources/appanimations.dart';
import 'package:recrutment_task/view/posts_view/posts_view.dart';
import 'package:recrutment_task/view_model/posts_view_model/posts_view_model.dart';
import 'package:video_player/video_player.dart';

import '../../resources/appcolors.dart';
import '../../resources/appicons.dart';
import '../../resources/appimages.dart';
import '../../utilities/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../posts_view/component/action_circle_buttons.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainpagecontroller=PageController();
    currentpage = 1.obs;
  }
  PageController mainpagecontroller=PageController();
 RxInt currentpage=1.obs;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.transparent,
      body:
      PageView.builder(
        scrollDirection: Axis.horizontal,
                onPageChanged: (value){
                  setState(() {
      currentpage.value=value;
      print('valueeee$value');
                  });
                },
              itemCount: 2,
                  controller: mainpagecontroller,
                  itemBuilder: (context,pageindex){

                    switch (pageindex) {
                      case 0:
                        return VideoPostsView(); // Widget for displaying videos
                    // Widget for displaying images
                      case 1:
                        return PostsView();
                      default:
                        return Container(
                          child: Text('Something went wrong'),
                        ); // Placeholder, you can customize as needed
                    }
                  }),);
  }
}




class VideoPostsView extends StatefulWidget {
  const VideoPostsView({super.key});

  @override
  State<VideoPostsView> createState() => _VideoPostsViewState();
}

PostsApiModel postsApiModel=PostsApiModel();
PostsviewModel postsviewModel=PostsviewModel();
class _VideoPostsViewState extends State<VideoPostsView> {
  @override
  String video_url='https://firebasestorage.googleapis.com/v0/b/laqtaat-2008.appspot.com/o/dev%2Fposts%2F287%2F1709035105813-4499.mp4?alt=media&token=c5bcb615-b6b6-43e7-8a92-9601972a84a6';
//String video_url='';
 late VideoPlayerController controller;
  void initState() {
    // TODO: implement initState
    super.initState();
    postsviewModel = PostsviewModel();
    postsApiModel = PostsApiModel();

     controller =VideoPlayerController.network(video_url)
      ..initialize().then((_) {
        setState(() {

        });
// Update the UI once the video is initialized
      });
    setState(() {

      postsviewModel.fetchPosts();
      postsviewModel.postslist;
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
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,

        backgroundColor: Colors.transparent,
        appBar: AppBar(automaticallyImplyLeading: false,
           backgroundColor: Appcolors.primary_color,
           title: Padding(
             padding: const EdgeInsets.fromLTRB(10.0,25,0,0),
             child: Row(
               children: [
                 Icon(AppIcons.close,size: 20,color: Appcolors.white,),
                 SizedBox(
                   width: Get.width*0.26,
                 ),
                 Text('Mobile',style: TextStyle(color: Appcolors.white),),
               ],
             ),
           ),
        ),

        floatingActionButton:Padding(
          padding: const EdgeInsets.fromLTRB(0.0,500,0,0),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              });
            },
            child: Icon(
            size: 30,
              color:Appcolors.white,

              controller != null && controller.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        ),
        body: SafeArea(
            child:
            Obx(() => Expanded(
              flex: 100,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                onPageChanged: (value){
                  setState(() {
                    video_url;
                  });


                },
                  //   itemCount: postsviewModel.postslist.length,
                  itemCount: postsviewModel.rxList.value.length,
                  itemBuilder: (context, index) {

                    print("urllll"+postsviewModel.rxList[index].posts![index].postVideo.toString());
                    video_url=postsviewModel.rxList[index].posts![index].postVideo.toString();
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
                                child:
                                controller != null && controller.value.isInitialized
                                    ? AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                )
                                    :
                                    SizedBox(
                                      height: Get.height*0.15,
                                      width: Get.width*0.17,
                                      child: Lottie.asset(Appanimations.loading_anim,height: 80,width: 80),
                                    ),


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
            )

      );
  }
}
