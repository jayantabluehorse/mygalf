import 'package:flutter/material.dart';
import '../newLogin/auth_controller.dart';
import '../product_page/product_controller.dart';
import '../cart/cart_controller.dart';
import 'package:get/get.dart';

import 'login.dart';

showotp(BuildContext context, mobile) {
  final AuthController _authController = Get.find<AuthController>();
  final ProductController productController = Get.find<ProductController>();
  final CartController _cartController = Get.find<CartController>();
  double logheight = MediaQuery.of(context).size.height;
  double logwidth = MediaQuery.of(context).size.width;

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: const EdgeInsets.all(5.0),
    content: Container(
        padding: const EdgeInsets.all(10),
        height: logheight < 670 ? logheight / 1.8 : logheight / 2,
        width: logwidth < 1024 ? logwidth / 2.5 : logwidth / 3.5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    size: 30,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "OTP Verification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: logwidth < 1245 ? logwidth / 2.5 : logwidth / 4,
              child: Column(
                children: [
                  const SizedBox(
                    child: Text(
                      "Please enter the One Time Password to verify your mobile number",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(mobile.toString()),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, showLogin(context));
                          },
                          child: const Text(
                            "Change",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF205e81)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: Row(
                      children: [
                        const Text(
                          "OTP sent to your mobile. If not received ",
                          style: TextStyle(fontSize: 12),
                        ),
                        InkWell(
                          onTap: () {
                            //print("resed OTP....");
                            _authController.resendOtp(context: context);
                          },
                          child: const Text(
                            " Resend",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF205e81)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: TextField(
                      controller: _authController.otp,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Enter OTP",
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Obx(
                    () => _authController.isError == true
                        ? SizedBox(
                            width:
                                logwidth < 1245 ? logwidth / 2.5 : logwidth / 4,
                            child: Text(
                              _authController.errorMessage.toString(),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 10),
                              textAlign: TextAlign.left,
                            ))
                        : const SizedBox(),
                  ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      _authController.optVerify(
                          context: context,
                          productController: productController,
                          cartController: _cartController);
                      // Navigator.pop(context);
                      // Navigator.popAndPushNamed( context, showDetailsPopUp(context, mobile));
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xFF205e81),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Verify OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
