import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './otp.dart';
import 'userDetails.dart';
import 'package:get_storage/get_storage.dart';



class AuthController extends GetxController {
  
  final storage          = GetStorage();
  var   getStorage       = {}.obs;
  final mobileController = TextEditingController();
  final otp              = TextEditingController();
  final fullName         = TextEditingController();
  final email            = TextEditingController();
  var   isError          = false.obs;
  var   errorMessage     = "".obs;
  var   data             = {}.obs;
  var   isLoading        = false.obs;
  var   id               = 1.obs;
  var   mobile           = '';


// mobile no use call sign up api
  void signinApiCall({required context}) async {
    print("12345");
    print(mobileController.text);
    if (mobileController.text == "") {
      isError(true);
      errorMessage("This feild is required");
    } else {
        if (mobileController.text.length != 10) {
            isError(true);
            errorMessage ("Mobile number must be 10 digits");
        }else{
            final RegExp regex = RegExp(r'^[0-9]+$');
            if (!regex.hasMatch(mobileController.text)) {
               isError(true);
              errorMessage("Mobile number must contain only digits");
            }else{
              isError(false);
             
              data({
                "storeId": 1,
                "mobile": mobileController.text,
              });
              try {
                  isLoading(true);
                  var response = await Dio().post("https://mygalf.tezcommerce.com/api/v1/auth/signInWithOtp",
                          data: data,
                          options: Options(headers: {
                            "token":
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
                          }));
                  if (response.statusCode == 200) {
                    
                     isLoading(false);
                    print(response.data["otp"]);
                    otp.text = "";
                    Get.snackbar("Your Otp is", "${response.data["otp"]}",
                    duration: Duration(seconds: 5),
            colorText: Colors.white,
            backgroundColor: Colors.green,
            maxWidth: MediaQuery.of(context).size.width * 0.30,
            margin: const EdgeInsets.only(top: 20));

                     Navigator.pop(context);
                     print(mobileController);
                     mobile = mobileController.text;
                     showotp(context,mobile);
                      
                     mobileController.text = "";
                  }
                } on DioError catch (e) {
                  isLoading(false);
                }
            }
        }
    }

  }



  // opt verify api  and check old and new user

    void optVerify({required context,required productController,required cartController}) async {
      
      if (mobile == "" || otp.text == "") {
        isError(true);
        errorMessage("All feild is required");
      } else {
        isError(false);
        data({
                "storeId" : 1,
                "mobile"  : mobile,
                "otp"     : otp.text
        });
        try {
                  isLoading(true);
                  var response = await Dio().post("https://mygalf.tezcommerce.com/api/v1/auth/verifyOtp",
                          data: data,
                          options: Options(headers: {
                            "token":
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
                          }));
                          print(response.statusCode);
                  if (response.statusCode == 200) {
                      if(response.data["success"] == true){
                          print(response.statusCode);
                          if(response.data["customerType"] == "newCustomer"){
                            id(int.parse( response.data["details"]["id"].toString()));
                            print(response.data["customerType"]);
                            print(response);
                            Navigator.pop(context);
                            showDetailsPopUp(context,mobile);

                          }else{
                              print( response.data["details"]);
                              var cartData = storage.read("cart");
                              if(cartData != null){
                                      addToCart(
                                        context: context,
                                        itemId: int.parse(cartData["id"].toString()),
                                        quantity: 1,
                                        customerId:int.parse(response.data["details"]["id"].toString()),
                                        cartController: cartController);
                              }
                              storage.write('loggedUserDetails', response.data["details"]);
                              getStorage(storage.read("loggedUserDetails"));
                              storage.remove("cart");
                              Get.toNamed("/products");

                          }
                      }else{
                        isError(true);
                        errorMessage(response.data["message"]);
                      }
                        print(response);
                  }
          } on DioError catch (e) {

          }
       }

    }




    // Resend otp
     void resendOtp({required context}) async {
          otp.text = "";
           isError(false);
             
              data({
                "storeId": 1,
                "mobile": mobile,
              });

               try {
                  isLoading(true);
                  var response = await Dio().post("https://mygalf.tezcommerce.com/api/v1/auth/signInWithOtp",
                          data: data,
                          options: Options(headers: {
                            "token":
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
                          }));
                          print(response.statusCode);
                  if (response.statusCode == 200) {
                     isError(false);
                      isLoading(false);
                      Get.snackbar("Your Otp is", "${response.data["otp"]}",
                    duration: Duration(seconds: 5),
            colorText: Colors.white,
            backgroundColor: Colors.green,
            maxWidth: MediaQuery.of(context).size.width * 0.30,
            margin: const EdgeInsets.only(top: 20));
                        print(response);
                  }
                } on DioError catch (e) {

                }

     }


     // sign Up

      void signUp({required context}) async {
          print(3);
        if (mobileController.text == "" || fullName.text == "" || email.text == "") {

              isError(true);
              errorMessage(" All feilds are required");
        }else{
            print(2);
          if (validateEmail(email.text)) {
            print(id);
           isError(false);
            data({
                "storeId": 1,
                "mobile": mobileController.text,
                "customerId": id.value,
                "fullName": fullName.text,
                "email": email.text
              });
        

         try {
                  isLoading(true);
                  var response = await Dio().post("https://mygalf.tezcommerce.com/api/v1/auth/signUp",
                          data: data,
                          options: Options(headers: {
                            "token":
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
                          }));
                          print(response.statusCode);
                  if (response.statusCode == 201) {
                    if(response.data["errorNode"]["errorCode"] == 0){
                     storage.write('loggedUserDetails', response.data["details"]);
                              getStorage(storage.read("loggedUserDetails"));
                              Get.toNamed("/products");
                    }else{
                            isError(true);
                           errorMessage(response.data["errorNode"]["errorMsg"]);
                    }
                     
                  }
                } on DioError catch (e) {
                      print(e);
                }
          }else{
             isError(true);
              errorMessage("Please Enter valid email"); 
          }

        }
      }

      bool validateEmail(String email) {
  // Define the regex pattern for email validation
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
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
      "type": "product",
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
    } finally {}

    // var data = jsonDecode(response.body);
    // print("${data['data']}");
    // if (response.statusCode == 200) {
    //   return {'success': data['success'], 'message': data['message']};
    // } else {
    //   return {'success': false, 'message': 'Failed to add item to cart.'};
    // }
  }
}