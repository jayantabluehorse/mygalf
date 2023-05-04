import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/navbar.dart';
import '../../components/request_callback/request_callback.dart';

// ignore: must_be_immutable
class OrderConfirmation extends StatelessWidget {
  List data = [
    {"name": "Sulav G", "orderId": 150025}
  ];

  OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 500
            ? "small"
            : currentWidth >= 500 && currentWidth <= 1100
                ? "medium"
                : "big";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 115,
        flexibleSpace:
            Navbar(currentScreen: currentScreen, selected: 'orderConfirmation'),
      ),
      body: Stack(
        children: [
          Container(
            width: currentWidth,
            // color: Colors.red,
            margin: const EdgeInsets.only(left: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Thank you for your purchase on the MyGALF !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: currentWidth / 1.51,

                  // margin: EdgeInsets.only(left: 150),
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Your Order Number is : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: Get.parameters["id"].toString(),
                            // text: data[0]['orderId'].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A3E4E)))
                      ])),
                      const SizedBox(height: 5),
                      const Text(
                          "you will shorly received the order confirmation along with tracking information on your e-mail."),
                      const SizedBox(height: 5),
                      const Text(
                          "We hope you had a great time shopping and look forward to seeing you again soon !"),
                      const SizedBox(height: 5),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/products");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          height: 45,
                          width: 180,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A3E4E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Continue Shopping",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const RequestCallback()
        ],
      ),
    );
  }
}
