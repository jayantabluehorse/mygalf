import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var isLoading = true.obs;

  void fetchWishList() async {
    print("calling fetch wish list");
  }
}
