import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  // final LocalStorage storage = LocalStorage('localstorage_app');
  final storage = GetStorage();
  var getStorage = {}.obs;
  final emailController = TextEditingController();

  final passController = TextEditingController();

  var isError = false.obs;
  var data = {}.obs;

  var errorMessage = "".obs;

  var isreadTerm = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStorage(storage.read("loggedUserDetails"));
  }

  void signinApiCall({required context, required cartController}) async {
    if (passController.text == "" || emailController.text == "") {
      // setState(() {
      isError(true);
      errorMessage(" All feilds are required");
      // });
    } else {
      isError(false);
      data({
        // "storeId": 1,

        "email": emailController.text,
        "password": passController.text,
      });

      try {
        isLoading(true);
        var response =
            await Dio().post("https://mygalf.tezcommerce.com/api/v1/auth/login",
                data: data,
                options: Options(headers: {
                  "token":
                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
                }));
        if (response.statusCode == 200) {
          // Get.snackbar(
          //     "Authentication Successfully", "We have verified account for you",
          //     colorText: Colors.white,
          //     backgroundColor: Colors.green,
          //     maxWidth: MediaQuery.of(context).size.width * 0.30,
          //     margin: const EdgeInsets.only(top: 20));
          // print(response.data["details"]);
          storage.write('loggedUserDetails', response.data["details"]);

          getStorage(storage.read("loggedUserDetails"));

          if (storage.read("cart") != null && storage.read("cart").length > 0) {
            handleAddtoCart(storage.read("cart"), cartController);
          }
          isLoading(false);

          Get.previousRoute == "/cart"
              ? Get.toNamed("/cart")
              : Get.toNamed("/");
        }
        print(response.statusCode);
      } on DioError catch (e) {
        // Something happened in setting up or sending the request that triggered an Error

        if (e.response != null) {
          isLoading(false);
          Get.snackbar("error !", "${e.response?.data?["message"]}",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              maxWidth: MediaQuery.of(context).size.width * 0.30,
              margin: const EdgeInsets.only(top: 20));
          print(e.response?.data?["message"]);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.requestOptions);
          print(e.message);
        }
      } finally {
        passController.text = "";
        emailController.text = "";
        isLoading(false);
      }
      print(data);
    }
  }

  void addToCart({required data, required cartController}) async {
    // print(
    // "-***********************${getStorage(storage.getItem("loggedUserDetails"))["id"]}");
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      "storeId": 1,
      "customerId": storage.read("loggedUserDetails")["id"],
      "items": data
    });
    String url =
        "http://mygalf.tezcommerce.com:3310/api/v1/cart/multipleProductAddToCart";
    print("ewwwwwwwwwwwwwwwwwww$body");

    try {
      final response =
          await Dio().post(url, data: body, options: Options(headers: headers));

      if (response.statusCode == 200) {
        cartController.getCartItems();
      }
    } catch (e) {
      print(e);
    } finally {
      cartController.getCartItems();
    }

    // print("${response.data}");
    // print("${response.statusCode}");
    // var data = jsonDecode(response.body);
    // print("${data['data']}");
    // if (response.statusCode == 200) {
    //   return {'success': data['success'], 'message': data['message']};
    // } else {
    //   return {'success': false, 'message': 'Failed to add item to cart.'};
    // }
  }

  void handleAddtoCart(cartItems, cartController) {
    var allData = [];

    for (var element in cartItems) {
      allData.add({
        "id": element["id"],
        "itemQuantity": element["itemQuantity"],
        "type": element["type"]
      });
    }

    addToCart(data: allData, cartController: cartController);
    storage.remove("cart");
  }
  // void handleAddtoCart(cartItems) {
  //   for (var element in cartItems) {
  //     addToCart(itemId: element["id"], quantity: element["itemQuantity"]);
  //   }
  //   storage.remove("cart");
  // }
}
