
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
class PostsApiModel {
  bool? status;
  String? message;
  List<Posts>? posts;

  PostsApiModel({this.status, this.message, this.posts});

  PostsApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? postId;
  int? userId;
  int? typeId;
  int? status;
  String? website;
  String? description;
  String? postVideo;
  String? hashtags;
  String? hashtagTitles;
  Null? postType;
  String? profileImage;
  String? name;
  int? countryId;
  String? country;
  String? flag;
  String? postTitle;
  List<Images>? images;
  int? likes;
  int? shares;
  int? comments;
  int? offers;
  String? type;

  Posts(
      {this.postId,
        this.userId,
        this.typeId,
        this.status,
        this.website,
        this.description,
        this.postVideo,
        this.hashtags,
        this.hashtagTitles,
        this.postType,
        this.profileImage,
        this.name,
        this.countryId,
        this.country,
        this.flag,
        this.postTitle,
        this.images,
        this.likes,
        this.shares,
        this.comments,
        this.offers,
        this.type,
      });

  Posts.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    userId = json['user_id'];
    typeId = json['type_id'];
    status = json['status'];
    website = json['website'];
    description = json['description'];
    postVideo = json['post_video'];
    hashtags = json['hashtags'];
    hashtagTitles = json['hashtag_titles'];
    postType = json['post_type'];
    profileImage = json['profile_image'];
    name = json['name'];
    countryId = json['country_id'];
    country = json['country'];
    flag = json['flag'];
    postTitle = json['post_title'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    likes = json['likes'];
    shares = json['shares'];
    comments = json['comments'];
    offers = json['offers'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['type_id'] = this.typeId;
    data['status'] = this.status;
    data['website'] = this.website;
    data['description'] = this.description;
    data['post_video'] = this.postVideo;
    data['hashtags'] = this.hashtags;
    data['hashtag_titles'] = this.hashtagTitles;
    data['post_type'] = this.postType;
    data['profile_image'] = this.profileImage;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['flag'] = this.flag;
    data['post_title'] = this.postTitle;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
    data['shares'] = this.shares;
    data['comments'] = this.comments;
    data['offers'] = this.offers;
    data['type'] = this.type;

    return data;
  }
}

class Images {
  String? image;
  int? isFirstPic;

  Images({this.image, this.isFirstPic});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isFirstPic = json['is_first_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['is_first_pic'] = this.isFirstPic;
    return data;
  }
}