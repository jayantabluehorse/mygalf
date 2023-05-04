import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../components/request_callback/request_callBack.dart';
import '../checkOut/checkout_controller.dart';
import 'package:get/get.dart';
import '../cart/cart_controller.dart';
import 'package:get_storage/get_storage.dart';

import '../newCart/widgets/OrderSummery.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({super.key});

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  final checkoutController = Get.find<CheckoutController>();
  final cartController = Get.find<CartController>();
  final storage = GetStorage();
  final couponController = TextEditingController();
  // var selectedAddressNew = 36;

  List sAddress = [
    {
      "name": "Jayanta Mahato",
      "mobile": "9064187130",
      "address": "B-13,Arabinda Nagar, Midnapore",
      "state": "West Bengal",
      "pin": "721102",
      "type": "Home",
      "gst": "ACV234XX76U55",
      "isBillingAddress": true
    },
    {
      "name": "Kio Dow",
      "mobile": "89561423",
      "address": "CC-19,New Town, Kolkata",
      "state": "West Bengal",
      "pin": "7000121",
      "type": "Work",
      "gst": "CVG769XX00",
      "isBillingAddress": false
    }
  ];
  // List billingAddress = [];

  bool isGstSelected = false;
  // bool newShippingAddress = false;

  // Map selectedAddress = {};

  // bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      checkoutController.getShippingAddresstItems();
      checkoutController.getBilliingAddresstItems();

      // setDefaultAddress();
    });
  }

  String _selectedValue = "Home";

  void _handleRadioValueChange(String value) {
    setState(() {
      _selectedValue = value;
    });
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
    return Title(
      title: "mygalf-heckout",
      color: Colors.blue,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 115,
            flexibleSpace:
                Navbar(currentScreen: currentScreen, selected: 'checkout'),
          ),
          body: Stack(
            children: [
              Obx(
                () => checkoutController.isLoading == true ||
                        cartController.isLoading == true
                    ? myLoader
                    : SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          color: const Color(0xFFeeeeee),
                          child: SizedBox(
                            width: currentWidth * 0.8,
                            child: Column(
                              children: [
                                _pageTitle(currentWidth),
                                SizedBox(
                                  width: currentWidth * 0.8,
                                  // color: Colors.pink,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _leftBox(currentWidth),
                                      _rightBox(currentWidth),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              const RequestCallback()
            ],
          )),
    );
  }

  SizedBox _rightBox(currentWidth) {
    return SizedBox(
      width: (currentWidth * 0.8) * 0.37,
      // color: Colors.yellow,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Text(
            "Order Summary",
            style: GoogleFonts.rubik(
                textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          // height: cartController.cartList.isEmpty ? 0 : 315,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartController.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return _productCard(index: index);
              }),
        ),
        const SizedBox(
          height: 15,
        ),
        OrderSummery(),
      ]),
    );
  }

  Container _productCard({required index}) {
    return Container(
      // height: 100,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      // color: Colors.red,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  cartController.cartList[index].thumbnailImages.toString()),
              radius: 30,
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                // color: Colors.blue,
                child: Row(children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        // color: Colors.orange,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartController.cartList[index].title.toString(),
                              softWrap: true,
                              maxLines: 2,
                              style: GoogleFonts.rubik(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  "₹ ${cartController.cartList[index].specialPrice.toString()}",
                                  style: GoogleFonts.rubik(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "₹ ${cartController.cartList[index].price.toString()}",
                                  style: GoogleFonts.rubik(
                                      textStyle: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough)),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 30,
                      // color: Colors.green,
                      child: Text(
                        "Qty: ${cartController.cartList[index].itemQuantity.toString()}",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(21),
                    child: InkWell(
                        onTap: () {
                          cartController.deleteProductFromCart(
                              type: cartController.cartList[index].type,
                              productId: cartController.cartList[index].id,
                              customerId:
                                  storage.read("loggedUserDetails")["id"]);
                        },
                        child: const Icon(Icons.delete)),
                  )
                ]),
              )),
        ],
      ),
    );
  }

  SizedBox _leftBox(currentWidth) {
    return SizedBox(
      width: (currentWidth * 0.8) * 0.6,
      // color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            // height: 430,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),

            child: Column(
              children: [
                _checkOutDeliveryTile(),
                const SizedBox(height: 20),
                _GST_info(),
                _paymentMethod(),
                _itemDelivery(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ListTile _paymentMethodCard({
  //   required String title,
  // }) {
  //   return ListTile(
  //     title: Text(
  //       title,
  //       style: GoogleFonts.rubik(textStyle: const TextStyle()),
  //     ),
  //     leading: Radio(
  //       activeColor: const Color(0xFF205e81),
  //       value: title,
  //       groupValue: _selectedPaymentMethod,
  //       onChanged: (value) {
  //         setState(() {
  //           _selectedPaymentMethod = value as String;
  //         });
  //       },
  //     ),
  //   );
  // }

  Widget _billingaddressCard(e) {
    return Obx(() => Container(
          child: InkWell(
            onTap: () {
              // deSelectOtherBillingAddress(billingAddress);
              setState(() {
                // e['isBillingAddress'] = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Colors.grey,
                  //       ),
                  //       borderRadius: BorderRadius.circular(2)),
                  //   height: 16,
                  //   width: 16,
                  //   padding: const EdgeInsets.all(1),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: e['isBillingAddress']
                  //             ? const Color.fromARGB(255, 10, 83, 155)
                  //             : Colors.grey,
                  //         borderRadius: BorderRadius.circular(2)),
                  //     height: 10,
                  //     width: 10,
                  //   ),
                  // ),
                  Radio(
                      value: e.id,
                      groupValue:
                          checkoutController.selectedBillingAddress.value,
                      onChanged: (_) {
                        print(checkoutController.selectedBillingAddress.value);
                        checkoutController.selectedBillingAddress.value = e.id;
                      }),

                  const SizedBox(width: 10),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "${e.fullName} - ${e.mobile}",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                              text: " ${e.address} - ${e.locality}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ])),
                        Text(
                          "${e.city},${e.state}-${e.pin}",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

    ///
    // return Container(
    //   padding: const EdgeInsets.all(5),
    //   decoration: BoxDecoration(
    //     // color: Colors.green,
    //     border: Border.all(color: Colors.grey),
    //     borderRadius: const BorderRadius.all(Radius.circular(5)),
    //   ),
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Row(
    //         children: [
    //           Radio(
    //             value: checkoutController.addressList[index].id,
    //             activeColor: const Color(0xFF205e81),
    //             groupValue: selectedAddressNew,
    //             onChanged: (value) {
    //               checkoutController.selectedAddress(
    //                   checkoutController.addressList[index].id);
    //               print("*********");
    //               print(checkoutController.addressList[index].id);
    //               print(checkoutController.selectedAddress);

    //               setState(() {
    //                 selectedAddressNew =
    //                     int.parse(checkoutController.addressList[index].id);
    //                 pinCodeNew = checkoutController.addressList[index].pin;
    //               });
    //             },
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           SizedBox(
    //             width: 145,
    //             child: Text(
    //               checkoutController.addressList[index].fullName,
    //               maxLines: 3,
    //               style: GoogleFonts.rubik(
    //                   textStyle: const TextStyle(fontWeight: FontWeight.bold)),
    //             ),
    //           )
    //         ],
    //       ),
    //       SizedBox(
    //         // color: Colors.red,
    //         width: 260,
    //         child: Text(
    //           checkoutController.addressList[index].address,
    //           softWrap: true,
    //         ),
    //       ),
    //       Expanded(
    //         child: SizedBox(
    //           // color: Colors.red,
    //           width: 260,
    //           child: Text(
    //             "${checkoutController.addressList[index].country.toString()} ,Pin:- ${checkoutController.addressList[index].pin.toString()}",
    //             softWrap: true,
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         // color: Colors.red,
    //         width: 260,
    //         child: Text(
    //           "Type :  ${checkoutController.addressList[index].addressType}",
    //           softWrap: true,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  /// Add Address

  Container _manageAddressHeading(handleRadioValueChange, selectedValue) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DottedBorder(
            color: Colors.grey, //color of dotted/dash line
            strokeWidth: 1, //thickness of dash/dots
            dashPattern: const [6, 6, 6, 6],
            //dash patterns, 10 is dash width, 6 is space width
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      _showAddressFormPopup(
                          context: context,
                          handleRadioValueChange: handleRadioValueChange,
                          selectedValue: selectedValue,
                          type: "shipping");
                    },
                    child: Text(
                      "Add Address",
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///top bar of page

  SizedBox _pageTitle(currentWidth) {
    return SizedBox(
      width: currentWidth * 0.8,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Checkout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "HOME / CHECKOUT",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  ///address popup

  void _showAddressFormPopup(
      {required BuildContext context,
      required handleRadioValueChange,
      required String selectedValue,
      required type}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(type == "billing" ? "Billig Address" : 'Shipping Address'),
          content: SizedBox(
              // width: MediaQuery.of(context).size.width / 2,
              child: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("NAME *"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.name,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Enter your name',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("MOBILE NUMBER*"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.mobile,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Enter Mobile Number',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    // width: MediaQuery.of(context).size.width / 4.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("STREET ADDRESS *"),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: checkoutController.houseNo,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Flat / House No. / Floor / Building ',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: checkoutController.street,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Colony / Stret / Locality',
                          ),
                        ),
                      ],
                    ),
                  ),

                  //land and pin
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("LANDMARK"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.landmark,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Landmark',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("PIN CODE *"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.pincode,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: '6-Digit pin code number ',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //state and city
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("STATE *"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.state,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'State',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("CITY *"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.city,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'City',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //company and gst
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("COMPANY NAME"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.companyName,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'Company Name',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("GST NUMBER"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: checkoutController.gst,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'GST Number',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  type == "billing"
                      ? const SizedBox()
                      : Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                      value: checkoutController
                                          .isShippingAddress.value,
                                      onChanged: (val) {
                                        checkoutController
                                                .isShippingAddress.value =
                                            !checkoutController
                                                .isShippingAddress.value;
                                        print(checkoutController
                                            .isShippingAddress.value);
                                      }),
                                  const SizedBox(width: 7),
                                  const Text("Is this Shipping address")
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              child: Row(children: [
                                Radio(
                                  value: "Home",
                                  groupValue: checkoutController
                                      .selectedShippingAddressType.value,
                                  onChanged: (_) {
                                    checkoutController
                                        .selectedShippingAddressType("Home");
                                  },
                                ),
                                const Text('Home'),
                                const SizedBox(width: 15),
                                Radio(
                                  value: "Work",
                                  groupValue: checkoutController
                                      .selectedShippingAddressType.value,
                                  onChanged: (_) {
                                    checkoutController
                                        .selectedShippingAddressType("Work");
                                  },
                                ),
                                const Text('Office'),
                                const SizedBox(width: 15),
                                Radio(
                                  value: "Others",
                                  groupValue: checkoutController
                                      .selectedShippingAddressType.value,
                                  onChanged: (_) {
                                    checkoutController
                                        .selectedShippingAddressType("Others");
                                  },
                                ),
                                const Text('Others'),
                              ]),
                            ),
                          ],
                        ),

                  checkoutController.isError.value
                      ? const Text(
                          "All feilds are required",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        )
                      : const Text(""),
                ],
              ),
            ),
          )),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (type == "billing") {
                  checkoutController.submitAddressData(
                      context: context, type: "billing");
                } else {
                  checkoutController.submitAddressData(
                      context: context, type: "shipping");
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // void _showShippingAddress({
  //   required BuildContext context,
  //   required handleRadioValueChange,
  //   required String selectedValue,
  // }) {
  //   TextEditingController nameController = TextEditingController();
  //   TextEditingController addressController1 = TextEditingController();
  //   TextEditingController cityController = TextEditingController();
  //   TextEditingController stateController = TextEditingController();
  //   TextEditingController pinController = TextEditingController();
  //   TextEditingController mobileController = TextEditingController();
  //   TextEditingController addressController2 = TextEditingController();
  //   TextEditingController landmarkController = TextEditingController();
  //   TextEditingController gstController = TextEditingController();
  //   TextEditingController companyController = TextEditingController();

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Billing Address'),
  //         content: SizedBox(
  //           // width: MediaQuery.of(context).size.width / 2,
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("NAME *"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: nameController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'Enter your name',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(width: 20),
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("MOBILE NUMBER*"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: mobileController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'Enter Mobile Number',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 15),
  //                 Container(
  //                   // width: MediaQuery.of(context).size.width / 4.5,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const Text("STREET ADDRESS *"),
  //                       const SizedBox(height: 5),
  //                       TextFormField(
  //                         controller: addressController1,
  //                         decoration: const InputDecoration(
  //                           border: OutlineInputBorder(),
  //                           contentPadding: EdgeInsets.all(5),
  //                           hintText: 'Flat / House No. / Floor / Building ',
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10),
  //                       TextFormField(
  //                         controller: addressController2,
  //                         decoration: const InputDecoration(
  //                           border: OutlineInputBorder(),
  //                           contentPadding: EdgeInsets.all(5),
  //                           hintText: 'Colony / Stret / Locality',
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),

  //                 //land and pin
  //                 const SizedBox(height: 15),

  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("LANDMARK"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: landmarkController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'Landmark',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(width: 20),
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("PIN CODE *"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: pinController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: '6-Digit pin code number ',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),

  //                 //state and city
  //                 const SizedBox(height: 15),

  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("STATE"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: stateController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'State',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(width: 20),
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("CITY *"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: cityController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'City',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 //company and gst
  //                 const SizedBox(height: 15),

  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("COMPANY NAME"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: companyController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'Company Name',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(width: 20),
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text("GST NUMBER"),
  //                           const SizedBox(height: 5),
  //                           TextFormField(
  //                             controller: gstController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               contentPadding: EdgeInsets.all(5),
  //                               hintText: 'GST Number',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 15),

  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width / 4.5,
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           Checkbox(value: true, onChanged: (_) {}),
  //                           const SizedBox(width: 7),
  //                           const Text("Same as shipping address")
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(width: 20),
  //                     Container(
  //                       child: Row(children: [
  //                         Radio(
  //                           value: "Home",
  //                           groupValue: "",
  //                           onChanged: (_) {},
  //                         ),
  //                         const Text('Home'),
  //                         const SizedBox(width: 15),
  //                         Radio(
  //                           value: "Office",
  //                           groupValue: _selectedValue,
  //                           onChanged: (_) {},
  //                         ),
  //                         const Text('Office'),
  //                         const SizedBox(width: 15),
  //                         Radio(
  //                           value: "others",
  //                           groupValue: "",
  //                           onChanged: (_) {},
  //                         ),
  //                         const Text('Others'),
  //                       ]),
  //                     ),
  //                   ],
  //                 ),

  //                 checkoutController.isError.value
  //                     ? const Text(
  //                         "All feilds are required",
  //                         style: TextStyle(fontSize: 12, color: Colors.red),
  //                       )
  //                     : const Text(""),
  //               ],
  //             ),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Submit the address data to the API
  //               String address1 = addressController1.text;
  //               String address2 = addressController2.text;
  //               String company = companyController.text;
  //               String city = cityController.text;
  //               String gst = gstController.text;
  //               String landmark = landmarkController.text;
  //               String mobile = mobileController.text;
  //               String name = nameController.text;
  //               String pin = pinController.text;
  //               String state = stateController.text;

  //               // checkoutController.submitAddressData(
  //               //     name,
  //               //     address1,
  //               //     address2,
  //               //     city,
  //               //     company,
  //               //     gst,
  //               //     landmark,
  //               //     mobile,
  //               //     name,
  //               //     pin,
  //               //     state,
  //               //     context);
  //             },
  //             child: const Text('Save'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  ///delivery address tile

  Widget _checkOutDeliveryTile() {
    return Container(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          "Select a delivery address",
          style: GoogleFonts.poppins(
              fontSize: 19, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        children: [
          Container(
            // color: Color.fromARGB(33, 76, 175, 79),
            child: Column(
              children: [
                _manageAddressHeading(_handleRadioValueChange, _selectedValue),
                // checkoutController.addressList.isEmpty
                //     ? const SizedBox()
                //     :

                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return shippingAddresses(constraints);
                  },
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      // newShippingAddress
                      //     ? newShippingAddress = false
                      //     : newShippingAddress = true;
                    });

                    // if (newShippingAddress) {
                    //   setState(() {
                    //     billingAddress = [];
                    //   });
                    // } else {
                    //   setState(() {
                    //     shippingAddress = billingAddress;
                    //   });
                    // }
                    print("Shipping Address: $sAddress");
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //       border: Border.all(
                        //         color: Colors.grey,
                        //       ),
                        //       borderRadius: BorderRadius.circular(2)),
                        //   height: 16,
                        //   width: 16,
                        //   padding: const EdgeInsets.all(1),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.red,
                        //         // color: newShippingAddress
                        //         //     ? Colors.grey
                        //         //     : const Color.fromARGB(255, 10, 83, 155),
                        //         borderRadius: BorderRadius.circular(2)),
                        //     height: 10,
                        //     width: 10,
                        //   ),
                        // ),
                        Checkbox(
                            value:
                                checkoutController.sameAsShippingAddress.value,
                            onChanged: (_) {
                              checkoutController.sameAsShippingAddress.value =
                                  !checkoutController
                                      .sameAsShippingAddress.value;
                            }),
                        const SizedBox(width: 10),
                        Text(
                          "Use as billing address",
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // checkoutController.addressList.isEmpty
                //     ? const SizedBox()
                //     :

                checkoutController.sameAsShippingAddress.value
                    ? const SizedBox()
                    : LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return billingAddress(constraints);
                        },
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

//gst info

  Widget _GST_info() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5),
              top: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                Checkbox(
                    value: checkoutController.isGstInvoice.value,
                    onChanged: (_) {
                      checkoutController.isGstInvoice.value =
                          !checkoutController.isGstInvoice.value;
                    }),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("GST Invoice",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: checkoutController.gstNo.value == "null"
                              ? " "
                              : checkoutController.gstNo.value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "  ${checkoutController.billingFullName.value}",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold))
                    ]))
                  ],
                ),
              ],
            ),
          ),
          isGstSelected
              ? InkWell(
                  onTap: () {
                    _showAddressFormPopup(
                        context: context,
                        handleRadioValueChange: _handleRadioValueChange,
                        selectedValue: _selectedValue,
                        type: "gst");
                  },
                  child: const Text(
                    "Change",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.green),
                  ),
                )
              : const Text(
                  "Change",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
        ],
      ),
    );
  }

  Widget billingAddress(constraints) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: .5)),
          width: constraints.maxWidth,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _showAddressFormPopup(
                      context: context,
                      handleRadioValueChange: _handleRadioValueChange,
                      selectedValue: _selectedValue,
                      type: "billing");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    children: const [
                      Icon(Icons.add, color: Color.fromARGB(255, 10, 83, 155)),
                      SizedBox(width: 5),
                      Text(
                        "Add New",
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 83, 155)),
                      )
                    ],
                  ),
                ),
              ),
              ...checkoutController.billingAddressList
                  .map((e) => _billingaddressCard(e)),
              // _addressCard(true),
              // _addressCard(false),
            ],
          ),
        ));
  }

  Widget shippingAddresses(BoxConstraints constraints) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: .5)),
        width: constraints.maxWidth,
        child: Wrap(
          children: [
            ...checkoutController.shippingAddressList
                .map((e) => _ShippingAddress(e))
          ],
        ));
  }

  Widget _ShippingAddress(e) {
    return Obx(() => InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 155,
            width: 220,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: e.id,
                        groupValue:
                            checkoutController.selectedShippingAddress.value,
                        onChanged: (_) {
                          print(
                              checkoutController.selectedShippingAddress.value);
                          checkoutController.selectedShippingAddress.value =
                              e.id;
                          checkoutController.billingFullName.value = e.fullName;
                          print("object---------${e.gstn}");
                          checkoutController.gstNo.value = e.gstn.toString();
                        }),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            e.addressType == 'Home'
                                ? const Icon(
                                    Icons.home,
                                    size: 17,
                                  )
                                : const Icon(
                                    Icons.work,
                                    size: 17,
                                  ),
                            const SizedBox(width: 5),
                            Text(e.addressType)
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "${e.fullName}  ${e.mobile}",
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Text("${e.locality}"),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  child: Text(
                    "${e.state}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _showAddressFormPopup(
                              context: context,
                              handleRadioValueChange: _handleRadioValueChange,
                              selectedValue: _selectedValue,
                              type: "shipping");
                        },
                        child: Text(
                          "Edit",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 10, 83, 155)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Delete",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 10, 83, 155)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void deSelectOtherShippingAddress(address) {
    for (int i = 0; i < address.length; i++) {
      setState(() {
        address[i]['isSelected'] = false;
      });
    }
  }

  void deSelectOtherBillingAddress(address) {
    for (int i = 0; i < address.length; i++) {
      setState(() {
        address[i]['isBillingAddress'] = false;
      });
    }
  }

//drop down
// item and delivery
  Widget _itemDelivery() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ExpansionTile(
          initiallyExpanded: false,
          title: Text(
            "Items and delivery",
            style: GoogleFonts.poppins(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }

//payment methods

  Widget _paymentMethod() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ExpansionTile(
          initiallyExpanded: false,
          title: Text(
            "Select a payment methos",
            style: GoogleFonts.poppins(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }

  void setDefaultAddress() {
    setState(() {
      // selectedAddress = sAddress[0];
      // selectedAddress['isSelected'] = true;
      // print("*************\n$selectedAddress\n");
      // print("*************\n$sAddress\n");
    });
  }
}

// Define a function to show the address form pop-up
