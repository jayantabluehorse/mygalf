import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_galf/services/api.dart';
import '../services_page/service_model.dart';

class ServicePageController extends GetxController {
  var isLoading = false.obs;
  var serviceList = [].obs;
  final storage = GetStorage();
  var getStorage = [].obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService().fetchPostData(
          "https://mygalf.tezcommerce.com/api/v1/service/list",
          {"storeId": 1},
          "products1");
      print("12345456789");
//print("${products}");
      // productList.assignAll(produts);
      serviceList.assignAll(products.map((ele) {
        return ServiceModel.fromJson(ele);
      }));

      // print("-----------------------------------");
    } catch (e) {
      print(e);
    } finally {
      print("${serviceList}");
      isLoading(false);
      // print("from productList ${productList.length}");
    }
  }

  void addToCart(
      {required int itemId,
      required int quantity,
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
      "itemQuantity": 1,
      "type": "service",
      "configId":"11"
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
  }

  // ---------------
  void handleAddtoCart(
      {required index, required context, required cartController}) {
    var loggedUser = storage.read("loggedUserDetails");

    print("logged user details IN PRODUCT CONTROLLER $loggedUser");

    if (loggedUser != null) {
      addToCart(
          context: context,
          itemId: serviceList[index].id,
          quantity: 1,
          customerId: loggedUser["id"],
          cartController: cartController);
      cartController.getCartItems();
    } else {
      // getStorage(storage.read("cart"));
      Map<String, dynamic> currentItem = serviceList[index].toJson();

      if (storage.read("cart") != null) {
        // print("first time not empty");
        bool found = false;

        for (var element in storage.read("cart")) {
          if (element["id"] == currentItem["id"]) {
            // print(
            //     "${element["id"].runtimeType}==${curremtItem["id"].runtimeType}");
            found = true;
            break;
          }
        }

        if (found) {
          Get.snackbar("add to cart", "Item already in cart",
              backgroundColor: Colors.red,
              maxWidth: MediaQuery.of(context).size.width * 0.30,
              margin: const EdgeInsets.only(top: 20),
              duration: const Duration(seconds: 1));
        } else {
          storage.write("cart", [
            ...storage.read("cart"),
            {...currentItem, "itemQuantity": 1}
          ]);
          getStorage([...storage.read("cart")]);
          // cartController.subTotal =
          //     cartController.subTotal + double.parse(currentItem["price"]);

          Get.snackbar("Added", "Item Added Successfully",
              backgroundColor: Colors.green,
              maxWidth: MediaQuery.of(context).size.width * 0.30,
              margin: const EdgeInsets.only(top: 20),
              duration: const Duration(seconds: 1));
        }
      } else {
        // print("first time");
        storage.write("cart", [
          {...currentItem, "itemQuantity": 1}
        ]);

        getStorage([...storage.read("cart")]);
        // cartController.subTotal =
        //     cartController.subTotal + double.parse(currentItem["price"]);
        Get.snackbar("Added", "Item Added Successfully",
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1));
      }
      storage.read("loggedUserDetails") != null
          ? Future.delayed(Duration.zero, () async {
              // myFunction();
              cartController.getCartItems();
            })
          : Future.delayed(Duration.zero, () async {
              cartController
                  .cartList(cartController.cartList(storage.read("cart")));
            });
    }
  }
}
