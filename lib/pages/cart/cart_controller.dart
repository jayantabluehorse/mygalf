import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:my_galf/pages/cart/cart_model.dart';

class CartController extends GetxController {
  var isLoading = false.obs;

  var cartList = [].obs;
  final storage = GetStorage();
  TextEditingController promocodeController = TextEditingController();

  Map get userS => (storage.read('loggedUserDetails') ?? {});
  var subTotal = 0.obs;
  final _temp = 0.obs;
  var cartTotalShippingPrice = 0.obs;
  var couponList = [].obs;
  var cartOriginalPrice = 0.obs;
  var cartDiscount = 0.obs;
  var cartTotalPrice = 0.obs;
  var cartTotalSpecialPrice = 0.obs;
  var appliedcouponCode = "".obs;
  var isCouponApplied = false.obs;
  var couponData = {}.obs;
  var couponErrorMessege = "".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await GetStorage.init();
    getCouponList();
    super.onInit();
    // getCartItems();
  }

  void applyCoupon({required customerId, required couponCode}) async {
    var url =
        "https://mygalf.tezcommerce.com/api/v1/cart-price-rule/offer-check";
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode(
        {"customerId": customerId, "storeId": 1, "couponCode": couponCode});

    try {
      var response =
          await Dio().post(url, data: body, options: Options(headers: headers));

      if (response.statusCode == 200) {
        if (response.data["cartPriceRuleOffer"][0]["message"] ==
            "Invalid Coupon") {
          couponErrorMessege.value =
              response.data["cartPriceRuleOffer"][0]["message"];
          promocodeController.text = couponCode;

          appliedcouponCode("");
          isCouponApplied(false);
          couponData({});
          storage.remove("coupon");
        } else {
          couponErrorMessege.value = "";
          promocodeController.text = couponCode;

          appliedcouponCode(couponCode);
          isCouponApplied(true);
          couponData({...response.data["cartPriceRuleOffer"][0]});

          storage.write("coupon", {
            ...couponData,
            "cartTotalShippingPrice": cartTotalShippingPrice.toString()
          });
        }

        print(response.data["cartPriceRuleOffer"]);
      }
    } catch (e) {
      print("error in cart controller $e");
    } finally {
      print("[[[[[[[[[[[[[]]]]]]]]]]]]]$couponData");
      isLoading(false);
    }
  }

  void getCouponList() async {
    const url =
        'https://mygalf.tezcommerce.com/api/v1/cart-price-rule/coupon-list';
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "storeId": 1,
    });

    try {
      var response =
          await Dio().post(url, data: body, options: Options(headers: headers));

      if (response.statusCode == 200) {
        couponList.assignAll([...response.data["couponList"]]);
      }
    } catch (e) {
      print("error in cart controller $e");
    } finally {
      print("[[[[[[[[[[[[[]]]]]]]]]]]]]$couponList");
      isLoading(false);
    }
  }

  void getCartItems() async {
    subTotal = _temp;
    cartList.clear();
    isLoading(true);
    print(
        "*********************--------------------**${storage.read("loggedUserDetails")}");

    const url = 'https://mygalf.tezcommerce.com/api/v1/cart/itemListing';
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "storeId": 1,
      "customerId": storage.read("loggedUserDetails")["id"],
    });
    try {
      var response =
          await Dio().post(url, data: body, options: Options(headers: headers));

      _temp(0);
      if (response.statusCode == 200) {
        cartList.assignAll([
          ...response.data["list"].map((i) {
            return CartModel(
                id: i['id'],
                cartId: i['cartId'],
                customerId: i['customerId'],
                itemQuantity: i['itemQuantity'],
                title: i['title'],
                slug: i['slug'],
                size: i['size'],
                weight: i['weight'],
                shortDescription: i['shortDescription'],
                price: i['price'],
                thumbnailImages: i['thumbnailImages'],
                productTotalPrice: i['productTotalPrice'],
                specialPrice: i['specialPrice'],
                type: i["type"]);
          })
        ]);

        subTotal(response.data["cartTotalPrice"]);
        cartTotalShippingPrice(response.data["cartTotalShippingPrice"]);
        cartOriginalPrice(response.data["cartOriginalPrice"]);
        cartDiscount(response.data["CartDiscount"]);
        cartTotalPrice(response.data["cartTotalPrice"]);
        cartTotalSpecialPrice(response.data["cartTotalSpecialPrice"]);

        isLoading(false);
      } else {
        isLoading(false);
        throw Exception('Failed to load cart items');
      }
    } catch (e) {
      print("error in cart controller $e");
    } finally {
      isLoading(false);
    }
  }

  void deleteProductFromCart(
      {required int productId, required int customerId, required type}) async {
    if (storage.read("loggedUserDetails") != null) {
      final url =
          Uri.parse('https://mygalf.tezcommerce.com/api/v1/cart/itemDelete');
      final headers = {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
        'Content-Type': 'application/json',
      };
      final body = json.encode({
        "storeId": 1,
        "customerId": customerId,
        "id": productId,
        "type": type
      });
      final response = await http.post(url, headers: headers, body: body);
      //  subTotal =
      //         subTotal + double.parse(currentItem["price"]);
      isCouponApplied(false);
      getCartItems();
    } else {}
  }

  void incrementCartItem(
      {required int productId, required int customerId, required type}) async {
    if (storage.read("loggedUserDetails") != null) {
      final url =
          Uri.parse('https://mygalf.tezcommerce.com/api/v1/cart/itemIncrement');
      final headers = {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
        'Content-Type': 'application/json',
      };
      final body = json.encode({
        "storeId": 1,
        "customerId": customerId,
        "id": productId,
        "type": type
      });
      final response = await http.post(url, headers: headers, body: body);
      isCouponApplied(false);
      getCartItems();
    } else {
// storage.write("cart", storage)
    }
  }

  void decrementCartItem(
      {required int productId, required int customerId, required type}) async {
    final url =
        Uri.parse('https://mygalf.tezcommerce.com/api/v1/cart/itemDecrement');
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "storeId": 1,
      "customerId": customerId,
      "id": productId,
      "type": type
    });
    final response = await http.post(url, headers: headers, body: body);
    isCouponApplied(false);
    getCartItems();
  }
}
