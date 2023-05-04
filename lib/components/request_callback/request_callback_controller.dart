import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestCallBackController extends GetxController {
  final mobile = TextEditingController();
  final name = TextEditingController();
  var nameError = false.obs;
  var numberError = false.obs;
  var isOpen = false.obs;

  void handleIsOpen() {
    isOpen.value = !isOpen.value;
    mobile.text = "";
    name.text = "";
    nameError.value = false;
    numberError.value = false;
  }

  bool validation() {
    if (name.text == "" || mobile.text == "") {
      return false;
    } else {
      return true;
    }
  }

  void errorHandler() {
    if (mobile.text == "") {
      if (name.text != "") {
        nameError(false);
      }
      numberError(true);
    }
    if (name.text == "") {
      if (mobile.text != "") {
        numberError(false);
      }
      nameError(true);
    }
  }

  void submitRequest() async {
    if (validation()) {
      numberError(false);
      nameError(false);
      var url = "https://mygalf.tezcommerce.com/api/v1/callbackRequest";
      var body = jsonEncode({
        "id": "",
        "storeId": 1,
        "requestDate": "2023-04-27",
        "name": name.text,
        "phone": mobile.text,
      });

      var response = await Dio().post(url,
          data: body,
          options: Options(headers: {
            "token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
          }));

      if (response.statusCode == 200) {
        print(response.data);
        // name.text = "";
        // mobile.text = "";
        handleIsOpen();
        Get.snackbar("Thank You", "Our team will contact you shortly",
            maxWidth: 500,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 1));
      }
    } else {
      errorHandler();
    }
  }
}
