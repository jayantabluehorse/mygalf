import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import '../constants/constrants.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "my shopping cart(${cartController.cartList.length})".toUpperCase(),
          style: cartTheme.cartHeading1,
        ),
        Text(
          "Home/My shopping cart".toUpperCase(),
          style: cartTheme.cartNormal1,
        )
      ],
    );
  }
}
