import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/navbar.dart';

class cartPage extends StatefulWidget {
  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  final couponController = TextEditingController();
  List data = [
    {
      "id": 001,
      "itemName": "Foodstrong Daily",
      "price": 1402,
      "quantity": 1,
    },
    {
      "id": 002,
      "itemName": "Foodstrong Daily",
      "price": 1402,
      "quantity": 1,
    },
    {
      "id": 003,
      "itemName": "Foodstrong Weekly",
      "price": 1550,
      "quantity": 1,
    },
    {
      "id": 004,
      "itemName": "Foodstrong Monthly",
      "price": 1500,
      "quantity": 1,
    },
    {
      "id": 005,
      "itemName": "Foodstrong Yearly",
      "price": 1800,
      "quantity": 1,
    }
  ];

  var subTotal;

  int discount = 0;

  @override
  void initState() {
    // TODO: implement initState
    toatalPrice();
  }

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
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 115,
        flexibleSpace: Navbar(currentScreen: currentScreen),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Stack(
          children: [
            Positioned(top: 0, child: heading(currentWidth)),
            Positioned(top: 120, child: content(currentWidth)),
          ],
        ),
      ),
    );
  }

  Widget heading(currentWidth) {
    return Container(
      height: 150,
      width: currentWidth,
      alignment: Alignment.center,
      color: const Color.fromARGB(255, 32, 93, 129),
      child: const SizedBox(
          child: Text(
        "Your Cart",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      )),
    );
  }

  Widget content(currentWidth) {
    return SizedBox(
      height: 900,
      width: currentWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 450,
            width: currentWidth / 1.8,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Product",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "                 Price",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Subtotal",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 315,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal:
                                BorderSide(width: 0.2, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    // color: Colors.red,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[200],
                                      child: Image.asset(
                                          "assets/images/whey_fst.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 150,
                                    // color: Colors.red,
                                    child: Text(
                                      data[index]['itemName'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 90,
                              // color: Colors.red,
                              child: Text(
                                "Rs.${data[index]['price'].toString()}",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 110,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (data[index]['quantity'] > 1) {
                                        setState(() {
                                          data[index]["quantity"]--;
                                          subTotal =
                                              subTotal - data[index]["price"];
                                        });
                                      }
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  Text(
                                    data[index]["quantity"].toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          data[index]['quantity']++;
                                          subTotal =
                                              (data[index]["price"] + subTotal);
                                        });
                                      },
                                      child: Icon(Icons.add)),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 90,
                                child: Text(
                                  "Rs.${(data[index]["quantity"] * data[index]["price"]).toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            Container(
                              height: 50,
                              width: 30,
                              child: InkWell(
                                onTap: () {
                                  deleteProductFromCart(data[index]['id']);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 250,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: couponController,
                          decoration: const InputDecoration(
                            hintText: "Coupon Code",
                            filled: true,
                            fillColor: Color.fromARGB(99, 158, 158, 158),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide(
                                  width: 0, color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (couponController.text == "") {
                          } else if (couponController.text == "mg100") {
                            setState(() {
                              discount = 100;
                            });
                          } else if (couponController.text == "mg500") {
                            setState(() {
                              discount = 500;
                            });
                          } else {
                            setState(() {
                              discount = 0;
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 150,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 32, 93, 129),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "Apply Coupon",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updateCart();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 32, 93, 129),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "Update Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 300,
            width: currentWidth / 4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cart Total",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Subtotals.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Rs.${subTotal.toString()}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        "Coupon Discount",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Rs.${discount.toString()}",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    Text("RS.${(subTotal - discount).toString()}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/checkOut");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 350,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 32, 93, 129),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Text(
                        "proceed to checkout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  toatalPrice() {
    num _temp = 0;
    data.forEach((element) {
      _temp += element["price"];
    });
    setState(() {
      subTotal = _temp;
    });
  }

  void deleteProductFromCart(data) {
    print("item will be deleted by api and the item id is :${data}");
  }

  void updateCart() {
    print("cart will be update by api ..");
    print(data);
  }
}
