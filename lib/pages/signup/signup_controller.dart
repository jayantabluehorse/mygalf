import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final passController = TextEditingController();

  final conPassController = TextEditingController();

  var finalPass = "".obs;

  var isError = false.obs;
  var data = {}.obs;

  var errorMessage = "".obs;

  var isreadTerm = false.obs;

  void signUpApiCall({required context}) async {
    if (phoneController.text == "" ||
        nameController.text == "" ||
        emailController.text == "") {
      // setState(() {
      isError(true);
      errorMessage(" All feilds are required");
      // });
    } else if (passController.text != conPassController.text) {
      finalPass(passController.text);
      isError(true);
      errorMessage(" Password Mismatched");

      // showErrorMessage();
    } else if (passController.text.length < 8 &&
        conPassController.text.length < 8) {
      isError(true);
      errorMessage(" Password Should be atleast 8 Characters");
    } else if (isreadTerm.value == false) {
      isError(true);
      errorMessage(" Please Check term and condition");
    } else {
      finalPass(passController.text);
      isError(false);
      data({
        "storeId": 1,
        "fullName": nameController.text,
        "email": emailController.text,
        "mobile": phoneController.text,
        "password": finalPass.value,
        "confirmPassword": finalPass.value
      });
      // print(nameController.text.runtimeType);
      try {
        isLoading(true);
        var response = await Dio().post(
          "https://mygalf.tezcommerce.com/api/v1/auth/signUp",
          data: data,
        );
        if (response.statusCode == 201) {
          Get.snackbar(
              "Account created Successfully", "We have created account for you",
              colorText: Colors.white,
              backgroundColor: Colors.green,
              maxWidth: MediaQuery.of(context).size.width * 0.30,
              margin: const EdgeInsets.only(top: 20));
          print(response);
          isLoading(false);
          Get.toNamed("/login");
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
          print(e.response?.headers);
          print(e.response?.requestOptions);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
  }
}
