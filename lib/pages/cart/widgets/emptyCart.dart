import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: currentWidth,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/empty-cart.svg",
              height: 100, width: 150, color: const Color(0xFF1A3E4E)),
          const SizedBox(height: 20),
          const Text(
            "Your cart is empty",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            // color: Colors.pink,
            width: currentWidth / 2.5,
            child: const Text(
              "Looks like you have not added anything to your cart.Go ahead & explore top categories.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.toNamed("/products");
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF1A3E4E),
              ),
              child: Text(
                "Continue Shopping".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
