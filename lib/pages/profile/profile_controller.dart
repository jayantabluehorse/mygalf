import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/constant.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var selectedButton = "Account Info".obs;
  var isPasswordVerified = false.obs;
  final previousPasswordController = TextEditingController();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var myOrdersList = [].obs;
  var userDetails = {}.obs;

  void getOrderDetails({required userId}) async {
    isLoading(true);
    String url = "https://mygalf.tezcommerce.com/api/v1/order/orderItemList";
    var body = {"storeId": 1, "customerId": userId};

    try {
      var response = await Dio().post(url, data: body);
      if (response.statusCode == 200) {
        print("/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/${response.data}");
        myOrdersList.assignAll([...response.data["list"]]);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
      }
    } finally {
      isLoading(false);
    }
  }

  void getUserDetails({required userId}) async {
    isLoading(true);
    String url =
        "https://mygalf.tezcommerce.com/api/v1/customer/customerDetails";

    final body = jsonEncode({"storeId": 1, "customerId": userId});

    try {
      final response = await Dio().post(url,
          data: body,
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
          }));

      if (response.statusCode == 200) {
        userDetails(response.data["data"]["details"]);
        print(
            "**-----------***********------------${response.data["data"]["details"]}");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void changePassword({required context, required userId}) async {
    print(previousPasswordController.text);
    print(newPasswordController.text);
    print(confirmPasswordController.text);
    var body = jsonEncode({
      "id": userId,
      "previousPassword": previousPasswordController.text,
      "newPassword": newPasswordController.text,
      "confirmPassword": confirmPasswordController.text
    });

    try {
      var response = await Dio().post(
        "https://mygalf.tezcommerce.com/api/v1/auth/changePassword",
        data: body,
      );
      if (response.statusCode == 201) {
        // print(response.data);
        snackbar(
            context: context,
            response: response.data["message"],
            type: "success");
        Future.delayed(
          const Duration(seconds: 1),
          () {
            Get.toNamed("/");
          },
        );
      } else {
        snackbar(
            context: context,
            response: response.data["message"],
            type: "error");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        snackbar(
            context: context,
            response: e.response?.data?["message"],
            type: "error");
      } else {
        snackbar(context: context, response: e.requestOptions, type: "error");
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      // snackbar(context: context, response: e.response["message"], type: "error");
    }
  }
}
