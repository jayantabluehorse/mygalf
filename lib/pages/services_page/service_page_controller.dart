import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePageController extends GetxController {
  ScrollController scrollController = ScrollController();
  RxDouble currenIndex = 0.1.obs; //-1
  // double currenIndex = 0.1;
  RxBool isCategory = true.obs;

  final List<Map> myProducts = [
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/img-1.jpg",
    },
    {"title": "Running Watch For Men", "image": "assets/images/img-2.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-3.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-4.jpg"},
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/img-1.jpg",
    },
    {"title": "Running Watch For Men", "image": "assets/images/img-2.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-3.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-4.jpg"},
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/img-1.jpg",
    },
    {"title": "Running Watch For Men", "image": "assets/images/img-2.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-3.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-4.jpg"},
  ];

  void typeHandler(type) {
    isCategory.value = type;
  }

  void updateLocation(index) {
    currenIndex.value = index;
  }
}
