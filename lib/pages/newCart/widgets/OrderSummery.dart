import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/checkOut/checkout_controller.dart';
import 'package:my_galf/pages/newCart/constants/constrants.dart';
import 'package:get_storage/get_storage.dart';

class OrderSummery extends StatelessWidget {
  final CartController _cartController = Get.find<CartController>();
  final CheckoutController _checkoutController = Get.find<CheckoutController>();
  final storage = GetStorage();
  List coupon = [
    {
      "code": "MG105",
      "desc": "get 50% off",
    },
    {
      "code": "MG50",
      "desc": "get 10% off",
    },
    {
      "code": "MG05",
      "desc": "get 5% off",
    },
    {
      "code": "MG10",
      "desc": "get 40% off",
    },
    {
      "code": "MG7105",
      "desc": "get 30% off",
    },
    {
      "code": "MG0905",
      "desc": "get 20% off",
    },
    {
      "code": "MG150",
      "desc": "get 15% off",
    }
  ];

  OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Obx(() => Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          width: (currentWidth * 0.8) * 0.37,
          // height: currentHeiht / 1.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Summary",
                style: cartTheme.cartHeading2,
              ),
              cartTheme.h4,
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Products (Inc GST)",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                        !_cartController.isCouponApplied.value
                            ? "₹${(_cartController.cartTotalPrice.value - _cartController.cartTotalShippingPrice.value).toStringAsFixed(2)}"
                            : "₹${_cartController.couponData["originalPrice"].toStringAsFixed(2)}"
                                .toString(),
                        style: const TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              cartTheme.h3,
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Discount",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(
                      !_cartController.isCouponApplied.value
                          ? " - ₹0.00"
                          : "₹${_cartController.couponData["discountedPrice"].toStringAsFixed(2)}"
                              .toString(),
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              cartTheme.h3,
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Shipping Charges",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(
                        "₹${_cartController.cartTotalShippingPrice.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              cartTheme.h3,
              Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(
                        !_cartController.isCouponApplied.value
                            ? "₹${_cartController.cartTotalPrice.toStringAsFixed(2)}"
                            : "₹${(double.parse(_cartController.couponData["offerPrice"].toString()) + double.parse(_cartController.cartTotalShippingPrice.toString())).toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              // storage.read("loggedUserDetails") != null
              //     ? Container(
              //         padding: const EdgeInsets.symmetric(vertical: 10.0),
              //         decoration: const BoxDecoration(
              //             border: Border(
              //                 bottom: BorderSide(color: Colors.grey, width: 0.5))),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             SizedBox(
              //               child: Row(
              //                 children: [
              //                   Container(
              //                     height: 15,
              //                     width: 15,
              //                     padding: const EdgeInsets.all(5),
              //                     decoration: BoxDecoration(
              //                         border: Border.all(color: Colors.grey),
              //                         color: const Color.fromARGB(255, 10, 83, 155),
              //                         borderRadius: BorderRadius.circular(10)),
              //                   ),
              //                   cartTheme.v2,
              //                   Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       const Text("GST Invoice",
              //                           style:
              //                               TextStyle(fontWeight: FontWeight.w700)),
              //                       RichText(
              //                           text: TextSpan(children: [
              //                         const TextSpan(
              //                             text: "18AABCU9603R1ZM - ",
              //                             style: cartTheme.subtitle),
              //                         TextSpan(
              //                             text: storage
              //                                 .read("loggedUserDetails")["fullName"]
              //                                 .toString(),
              //                             style: cartTheme.Carttitle)
              //                       ]))
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             InkWell(
              //               onTap: () {
              //                 print("change gst details");
              //               },
              //               child: const Text(
              //                 "Change",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w600, color: Colors.green),
              //               ),
              //             )
              //           ],
              //         ),
              //       )
              //     : const SizedBox(),
              _cartController.isCouponApplied == true
                  ? cartTheme.h3
                  : const SizedBox(
                      height: 5,
                    ),

              _cartController.isCouponApplied == true
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color.fromARGB(131, 111, 245, 116)
                              .withOpacity(0.2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You save "),
                          Text(
                            "₹${_cartController.couponData["discountedPrice"].toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(" in this order"),
                        ],
                      ),
                    )
                  : const SizedBox(),
              cartTheme.h3,
              const SizedBox(
                  // width: MediaQuery.of(context).size.width / 6,
                  child: FittedBox(
                child: Text(
                    "PAY USING : EMI | Credit/Debit Cards | UPI | Net Banking | Wallets | Rewards",
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              )),
              cartTheme.h4,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 2, left: 10, bottom: 2, right: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    width: MediaQuery.of(context).size.width / 6,
                    height: 35,
                    child: TextField(
                      controller: _cartController.promocodeController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Enter a promo code",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  InkWell(
                    onTap: () {
                      if (_cartController.promocodeController.text != "") {
                        _cartController.applyCoupon(
                            couponCode: _cartController.promocodeController.text
                                .toString(),
                            customerId:
                                storage.read("loggedUserDetails")["id"]);
                      } else {
                        _cartController.couponErrorMessege.value =
                            "Plese enter coupon code";
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF205e81),
                      ),
                      width: MediaQuery.of(context).size.width / 14,
                      height: 35,
                      child: const Text(
                        "Apply",
                        softWrap: true,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _cartController.isCouponApplied.value
                  ? const Text(
                      "Coupon applied successfully",
                      style: TextStyle(color: Colors.green),
                    )
                  : const SizedBox(),
              Text(
                _cartController.couponErrorMessege.value,
                style: const TextStyle(color: Colors.red),
              ),
              cartTheme.h4,

              InkWell(
                onTap: () {
                  showCouponCode(context);
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),

                    // color: const Color(0xFF205e81),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "View Discount Code",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),

              cartTheme.h4,
              InkWell(
                onTap: () {
                  if (Get.currentRoute == "/cart") {
                    Get.toNamed("/checkout");
                  } else {
                    _checkoutController.shippingAddressList.isEmpty
                        ? Get.snackbar(
                            "Your address is empty", "Plese add your address",
                            backgroundColor: Colors.blue,
                            colorText: Colors.white,
                            maxWidth: 300)
                        : _checkoutController.submitOrder();
                  }
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF205e81),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Checkout",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  showCouponCode(BuildContext context) {
    double logheight = MediaQuery.of(context).size.height;
    double logwidth = MediaQuery.of(context).size.width;
    AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(5.0),
        content: Container(
          padding: const EdgeInsets.all(10),
          height: 400,
          width: logwidth < 1024 ? logwidth / 2.0 : logwidth / 2.5,
          child: Column(
            children: [
              const Text(
                "Available Coupons",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF205e81)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 315,
                child: ListView(
                  children: [
                    ..._cartController.couponList.map(
                      (e) => _couponCard(data: e, context: context),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _couponCard({required data, required context}) {
    return LayoutBuilder(
      builder: (p0, constraint) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(7),
          width: 350,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 0.5))),
          // height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraint.maxWidth * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['couponCode'],
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['description'],
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _cartController.applyCoupon(
                      couponCode: data['couponCode'],
                      customerId: storage.read("loggedUserDetails")["id"]);
                  // _cartController.couponCode("data['couponCode']");
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: constraint.maxWidth * 0.2,
                  decoration: BoxDecoration(
                      color: const Color(0xFF205e81),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
