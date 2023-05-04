import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:my_galf/pages/checkOut/address_model.dart';

class CheckoutController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage();
  var shippingAddressList = [].obs;
  var billingAddressList = [].obs;
  var selectedPaymentMethod = "Cash On Delivery".obs;
  var message = ''.obs;
  var isError = false.obs;
  var errorMessage = "".obs;
  var isShippingAddress = false.obs;
  var selectedShippingAddressType = "Home".obs;
  var selectedShippingAddress = 0.obs;
  var selectedBillingAddress = 0.obs;
  var sameAsShippingAddress = true.obs;
  var isGstInvoice = false.obs;
  var gstNo = "".obs;
  var billingFullName = "".obs;

  final name = TextEditingController();
  final mobile = TextEditingController();
  final houseNo = TextEditingController();
  final street = TextEditingController();
  final landmark = TextEditingController();
  final pincode = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final companyName = TextEditingController();
  final gst = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    // await GetStorage.init();
    super.onInit();
    // getAddresstItems();
  }

  // Define a function to submit the address data to the API
  void submitAddressData({required context, required type}) async {
    print("address submit");

    if (name.text == "" ||
        mobile.text == "" ||
        houseNo.text == "" ||
        street.text == "" ||
        pincode.text == "" ||
        state.text == "" ||
        city.text == "") {
      isError(true);
      errorMessage(" All feilds are required");
      Get.snackbar("All required filled need to fill", "",
          maxWidth: 400, backgroundColor: Colors.red, colorText: Colors.white);
      print("empty");
    } else {
      isError(false);
      Navigator.of(context).pop();
      final url = Uri.parse(
          'https://mygalf.tezcommerce.com/api/v1/customer/customerAddressCreate');
      final headers = {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "storeId": 1,
        "customerId": storage.read("loggedUserDetails")["id"],
        'name': name.text,
        "mobile": mobile.text,
        'address': houseNo.text,
        "address1": street.text,
        'locality': street.text,
        "city": city.text,
        "pinCode": pincode.text,
        "state": state.text,
        "landmark": landmark.text,
        "companyName": companyName.text,
        "gstn": gst.text,
        'addressType': selectedShippingAddressType.value,
        "type": type
      });

      print(body);

      try {
        var response = await http.post(url, headers: headers, body: body);
        print(response.body);
        if (response.statusCode == 200) {
          getShippingAddresstItems();
          getBilliingAddresstItems();
          // Address data was submitted successfully
          print('Address data submitted successfully');
        } else {
          // Address data submission failed
          print('Address data submission failed');
        }
      } finally {
        name.text = "";
        mobile.text = "";
        houseNo.text = "";
        street.text = "";
        pincode.text = "";
        state.text = "";
        city.text = "";
        companyName.text = "";
        gst.text = "";
        isShippingAddress.value = false;
        selectedShippingAddressType.value = "Home";
      }
    }
  }

  void getShippingAddresstItems() async {
    isLoading(true);

    const url =
        'https://mygalf.tezcommerce.com/api/v1/customer/billingShippingAddressList';
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "storeId": 1,
      "customerId": storage.read("loggedUserDetails")["id"],
      "type": "shipping"
    });

    try {
      var response =
          await Dio().post(url, data: body, options: Options(headers: headers));
      if (response.statusCode == 200) {
        shippingAddressList.assignAll(response.data["list"].map((ele) {
          return AddressModel.fromJson(ele);
        }));

        for (var i in shippingAddressList) {
          if (i.isPrimary == "yes") {
            selectedShippingAddress(i.id);
            billingFullName(i.fullName);
            print("selected ${i.gstn}");
            gstNo(i.gstn);
          }
        }
        isLoading(false);
      } else {
        isLoading(false);
        throw Exception('Failed to load cart items');
      }
    } catch (e) {
      isLoading(false);
      print("error in cart controller $e");
    } finally {
      isLoading(false);
    }
  }

  void getBilliingAddresstItems() async {
    isLoading(true);

    const url =
        'https://mygalf.tezcommerce.com/api/v1/customer/billingShippingAddressList';
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "storeId": 1,
      "customerId": storage.read("loggedUserDetails")["id"],
      "type": "billing"
    });

    try {
      var response =
          await Dio().post(url, data: body, options: Options(headers: headers));
      if (response.statusCode == 200) {
        billingAddressList.assignAll(response.data["list"].map((ele) {
          return AddressModel.fromJson(ele);
        }));
        if (billingAddressList.isNotEmpty) {
          selectedBillingAddress(billingAddressList[0].id);
        }
        // for (var i in billingAddressList) {
        //   if (i.isPrimary == "yes") {
        //     selectedBillingAddress(i.id);
        //     // billingFullName(i.fullName);
        //     // print("selected ${i.gstn}");
        //     // gstNo(i.gstn);
        //   }
        // }
        isLoading(false);
      } else {
        isLoading(false);
        throw Exception('Failed to load cart items');
      }
    } catch (e) {
      isLoading(false);
      print("error in cart controller $e");
    } finally {
      isLoading(false);
    }
  }

  void submitOrder() async {
    final url = Uri.parse('https://mygalf.tezcommerce.com/api/v1/order/add');
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };

    var body = json.encode({
      "storeId": 1,
      "customerId": storage.read("loggedUserDetails")["id"],
      "deliveryCharges": '',
      "customerAddressId": int.parse(selectedShippingAddress.toString()),
      "paymentMode": "Cash on delivery"
    });
    print(body);
    var response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //Get.snackbar(data['data']['orderId'], data['data']['message'],backgroundColor: Colors.grey);
      Future.delayed(const Duration(seconds: 2), () async {
        // myFunction();
        Get.toNamed("/order-confrim/${data['data']['orderId']}");
      });
      //print("${data}");
    } else {}
  }
}
