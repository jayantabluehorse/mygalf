import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/pages/product_details_page/product_details_model.dart';
import 'package:my_galf/services/api.dart';
import 'package:get_storage/get_storage.dart';
import '../newLogin/login.dart';


class ProductDetailsController extends GetxController {
  var isLoading = false.obs;
  List<ProductDetailsModel> productDetailsData = <ProductDetailsModel>[].obs;
  final storage = GetStorage();
  var getStorage = [].obs;
  var quantity = 1.obs;
  var per = 0.obs;
  var selectedImage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    // fetchProducts(5);
  }

  void fetchProducts(id) async {
    try {
      isLoading(true);
      var products = await ApiService().fetchPostData(
          "https://mygalf.tezcommerce.com/api/v1/product/view",
          {
            "productId": int.parse(id),
            "storeId": 1,
            "customerId": '',
            "type": "product",
            "configId": null
          },
          "products");

      // print(products.data['price']);
      productDetailsData.assignAll([ProductDetailsModel.fromJson(products)]);
      selectedImage.value = productDetailsData[0].thumbnailImage;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      // print("from productDetails $productDetailsData");
    }
  }

  void addToCart(
      {required int itemId,
      required customerId,
      required context,
      required cartController}) async {
    const url = 'https://mygalf.tezcommerce.com/api/v1/cart/productAddToCart';
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      "storeId": 1,
      "customerId": customerId,
      "id": itemId,
      "type": "product",
      "itemQuantity": int.parse(quantity.toString())
    });

    try {
      final response =
          await Dio().post(url, data: body, options: Options(headers: headers));
      if (response.data["success"] == true) {
        Get.snackbar("Add to cart", "${response.data["message"]}",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            maxWidth: MediaQuery.of(context).size.width * 0.30,
            margin: const EdgeInsets.only(top: 20));

        print("-------------$response");
        cartController.getCartItems();
      } else {
        Get.snackbar("error !", response.data["message"].toString(),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            maxWidth: MediaQuery.of(context).size.width * 0.30,
            margin: const EdgeInsets.only(top: 20));
      }
    } catch (e) {
      print("-------------$e");
      Get.snackbar("error !", e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          maxWidth: MediaQuery.of(context).size.width * 0.30,
          margin: const EdgeInsets.only(top: 20));
    }

    // var data = jsonDecode(response.body);
    // print("${data['data']}");
    // if (response.statusCode == 200) {
    //   return {'success': data['success'], 'message': data['message']};
    // } else {
    //   return {'success': false, 'message': 'Failed to add item to cart.'};
    // }
  }

  void handleAddtoCart({
    required context,
    required cartController,
    required id,
  }) {
    var loggedUser = storage.read("loggedUserDetails");

    print("logged user details IN PRODUCT CONTROLLER $loggedUser");

    if (loggedUser != null) {
      addToCart(
          context: context,
          itemId: int.parse(id),
          customerId: loggedUser["id"],
          cartController: cartController);
          cartController.getCartItems();
    } else {
      storage.write("cart", productDetailsData[0].toJson());
      showLogin(context);
    }
  }

 void imageChage({required image}){
        selectedImage.value = image;
  }

  String calculateDiscount({required mrp, required discountedPrice}) {
    mrp = double.parse(mrp);
    discountedPrice = double.parse(discountedPrice);

    var discount = mrp - discountedPrice;

    double discountRate = (discount / mrp) * 100;
    return discountRate.toStringAsFixed(2);
  }
}
