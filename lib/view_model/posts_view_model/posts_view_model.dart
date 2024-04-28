
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:recrutment_task/model/apiModel/postsapi_model.dart';
import 'package:recrutment_task/model/pageSlider_model/PageSliderModel.dart';
import 'package:recrutment_task/resources/appcolors.dart';
import 'package:recrutment_task/resources/constants.dart';
import 'package:recrutment_task/view/posts_view/posts_view.dart';
import 'package:video_player/video_player.dart';

PostsApiModel apiModel=PostsApiModel();


class PostsviewModel extends GetxController with WidgetsBindingObserver{


 RxList <Posts>postslist=<Posts>[].obs;
 RxList <PostsApiModel>rxList=<PostsApiModel>[].obs;
// Function to fetch post data from API
 Future<void> fetchPosts() async {
  try{
  final response = await http.post(Uri.parse(Constants.postsurl));
  if (response.statusCode==200) {
   print('response' + response.body);
   final jsonData = json.decode(response.body);
   final apiModel = PostsApiModel.fromJson(jsonData);
   print('apimodel' + apiModel.toString());
  // postslist.value = apiModel.posts ?? [];
   rxList.add(apiModel);
   // Assuming apiModel.posts is a List
   print('posts list after assignment:');
   print('rxliat'+rxList.toString());;
   print(postslist.toList());
  } else(error) {
   Get.snackbar('Error', error.toString(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Appcolors.red,
    colorText: Appcolors.white,
   );
   print('Failed to load post data');
   throw Exception('Failed to load post data');
  };
  }catch(erro){
Get.snackbar('Error',erro.toString(),
snackPosition: SnackPosition.TOP,
 backgroundColor: Appcolors.red,
 colorText: Appcolors.white,
);
  }
 }


}

