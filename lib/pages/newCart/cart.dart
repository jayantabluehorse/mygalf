import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/cart/widgets/emptyCart.dart';
import 'package:my_galf/pages/product_page/product_controller.dart';
import '../../components/navbar.dart';
import '../../components/request_callback/request_callback.dart';
import './constants/constrants.dart';
import 'widgets/Fetures.dart';
import 'widgets/ItemsCart.dart';
import 'widgets/OrderSummery.dart';
import 'widgets/SuggestItems.dart';
import 'widgets/TopBar.dart';
import 'package:get_storage/get_storage.dart';

class NewCart extends StatefulWidget {
  const NewCart({super.key});

  @override
  State<NewCart> createState() => _NewCartState();
}

class _NewCartState extends State<NewCart> {
  final CartController _cartController = Get.find<CartController>();
  final ProductController _productController = Get.find<ProductController>();
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
    // storage.read("loggedUserDetails") != null
    //     ?

    Future.delayed(Duration.zero, () {
      // _productController.fetchProducts();
      _cartController.getCartItems();
    });
    // : null;
    // storage.read("loggedUserDetails") == null && storage.read("cart") != null
    //     ? Future.delayed(Duration.zero, () async {
    //         getTotalPrice();
    //       })
    //     : null;
  }

  void getTotalPrice() {
    double sum = 0;
    for (var ele in storage.read("cart")) {
      sum = sum + (double.parse(ele["price"]) * ele["itemQuantity"]);
    }
    // print("------------**********-*-*-*-*-*-*-----*object$sum");
    _cartController.subTotal(int.parse(sum.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 600
            ? "small"
            : currentWidth >= 600 && currentWidth <= 1200
                ? "medium"
                : "big";
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 115,
          flexibleSpace: Navbar(currentScreen: currentScreen, selected: 'cart'),
        ),
        body: Stack(
          children: [
            Obx(
              () => _cartController.isLoading == true
                  ? myLoader
                  : _cartController.cartList.isEmpty
                      ? const EmptyCart()
                      : Container(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: currentWidth / 1.25,
                                  child: Column(
                                    children: [
                                      cartTheme.h4,
                                      TopBar(),
                                      cartTheme.h4,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          cartItem(
                                              getTotalPrice: getTotalPrice),
                                          OrderSummery()
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  // height: 300,
                                  // width: 900,
                                  color: Colors.white,
                                  child: SuggestItems(),
                                ),
                                const SizedBox(height: 10),
                                Fetures()
                              ],
                            ),
                          ),
                        ),
            ),
            const RequestCallback()
          ],
        ));
  }
}
