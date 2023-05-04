import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/navbar.dart';
import '../cart/cart_controller.dart';
import 'package:get_storage/get_storage.dart';

import 'widgets/emptyCart.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  final cartController = Get.find<CartController>();
  final couponController = TextEditingController();

  final storage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    storage.read("loggedUserDetails") != null
        ? Future.delayed(Duration.zero, () {
            cartController.getCartItems();
          })
        : null;
    storage.read("loggedUserDetails") == null && storage.read("cart") != null
        ? Future.delayed(Duration.zero, () async {
            getTotalPrice();
          })
        : null;
  }

  int discount = 0;
  void getTotalPrice() {
    double sum = 0;
    for (var ele in storage.read("cart")) {
      sum = sum + (double.parse(ele["price"]) * ele["itemQuantity"]);
    }

    cartController.subTotal(int.parse(sum.toString()));
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //     "***************************----------------${cartController.cartList[0]["id"]}");
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
          flexibleSpace: Navbar(currentScreen: currentScreen, selected: 'cart'),
        ),
        body: Obx(
          () => cartController.isLoading == true
              ? myLoader
              : cartController.cartList.isEmpty
                  ? const EmptyCart()
                  : Container(
                      color: Colors.grey[400],
                      child: Stack(
                        children: [
                          Positioned(top: 0, child: heading(currentWidth)),
                          Positioned(
                              top: 120,
                              child: content(
                                  currentWidth: currentWidth,
                                  cartList: cartController.cartList)),
                        ],
                      ),
                    ),
        ));
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

  Widget content({currentWidth, required cartList}) {
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
                SizedBox(
                  height: 315,
                  child: storage.read("loggedUserDetails") != null &&
                          cartController.cartList.isNotEmpty
                      ? ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            return _cartItemCard(cartList, index);
                          },
                        )
                      : storage.read("loggedUserDetails") == null &&
                              cartController.cartList.isEmpty
                          ? const Text("Cart is empty")
                          : storage.read("loggedUserDetails") == null &&
                                  storage.read("cart") != null &&
                                  storage.read("cart").length > 0
                              ? ListView.builder(
                                  itemCount: storage.read("cart").length,
                                  itemBuilder: (context, index) {
                                    return _cartItemCardLocal(
                                        storage.read("cart"), index);
                                  },
                                )
                              : const Text("Cart is Empty"),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
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
                      cartController.subTotal.toString(),

                      // storage.read("cart").length > 0
                      //     ? storage.read("cart").toList().reduce((val, ele) {
                      //         // print(
                      //         //     "****************************${double.parse(ele["price"])}");
                      //         return val + double.parse(ele["price"]);
                      //       }).toString()
                      //     : "",

                      // "Rs.${cartController.subTotal.toString()}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    Text(
                        "RS.${(cartController.subTotal - discount).toString()}",
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
                      // print(Get.previousRoute);
                      // cartController.cartList.isEmpty
                      //     ? Get.snackbar("warnning !",
                      //         "Please add something in your cart to checkout",
                      //         backgroundColor: Colors.blue,
                      //         colorText: Colors.white,
                      //         maxWidth:
                      //             MediaQuery.of(context).size.width * 0.30,
                      //         margin: const EdgeInsets.only(top: 20))
                      //     : Get.toNamed("/checkOut");

                      storage.read("loggedUserDetails") != null
                          ? Get.toNamed("/checkOut")
                          : Get.toNamed("/login");
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

  Container _cartItemCardLocal(cartList, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      height: 80,
      decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border(
              bottom:
                  BorderSide(width: 0.2, color: Colors.grey.withOpacity(0.4)))
          // border: Border.symmetric(
          //   horizontal: BorderSide(width: 0.2, color: Colors.grey),
          // ),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              // SizedBox(
              //   height: 50,
              //   width: 50,
              //   // color: Colors.red,
              //   child: cartList[index]["type"] == "service"
              //       ? CircleAvatar(
              //           backgroundColor: Colors.grey[200],
              //           backgroundImage:
              //               NetworkImage(cartList[index]["image"]),
              //         )
              //       : CircleAvatar(
              //           backgroundColor: Colors.grey[200],
              //           backgroundImage:
              //               NetworkImage(cartList[index]["thumbnailImage"]),
              //         ),
              // ),
              SizedBox(
                width: 10,
              ),
              // SizedBox(
              //   height: 50,
              //   width: 150,
              //   // color: Colors.red,
              //   child: Text(
              //     cartList[index]["type"] == "service"
              //         ? cartList[index]["name"].toString()
              //         : cartList[index]["title"].toString(),
              //     // "title",

              //     style: const TextStyle(
              //         fontWeight: FontWeight.bold, fontSize: 16),
              //     softWrap: true,
              //     maxLines: 2,
              //   ),
              // ),
            ],
          ),
          // Container(
          //   alignment: Alignment.center,
          //   height: 50,
          //   width: 90,
          //   // color: Colors.red,
          //   child: Text(
          //     "Rs.${cartList[index]["price"].toString()}",
          //     // "price",
          //     // ignore: prefer_const_constructors
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //   ),
          // ),
          Container(
            // height: 20,
            width: 100,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.grey, width: 0.2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // var temp = storage.read("cart");
                    // if (temp[index]["itemQuantity"] > 1) {
                    //   temp[index]["itemQuantity"]--;
                    //   storage.write("cart", temp);
                    //   cartController.cartList([...temp]);
                    //   getTotalPrice();
                    // }
                  },
                  child: const Icon(Icons.remove),
                ),
                // Text(
                //   // cartList[index]["itemQuantity"]
                //   //     .toString(),
                //   cartList[index]["itemQuantity"].toString(),
                //   style: const TextStyle(fontWeight: FontWeight.bold),
                // ),
                InkWell(
                    onTap: () {
                      // var temp = storage.read("cart");
                      // temp[index]["itemQuantity"]++;
                      // storage.write("cart", temp);
                      // cartController.cartList([...temp]);
                      // getTotalPrice();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 90,
              child: Text(
                "Rs.${(double.parse(cartList[index]["price"]) * cartList[index]["itemQuantity"]).toString()}",
                // "qty*price",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          SizedBox(
            height: 50,
            width: 30,
            child: InkWell(
              onTap: () {
                var temp = storage.read("cart");
                var currPrice = cartController.subTotal -
                    (double.parse(temp[index]["price"]).toInt());
                cartController.subTotal = currPrice;
                temp.removeAt(index);
                storage.write("cart", temp);
                cartController.cartList([...temp]);

                // cartController
                //     .deleteProductFromCart(
                //         cartList[index]["id"]);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _cartItemCard(cartList, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 80,
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border(
            bottom:
                BorderSide(width: 0.2, color: Colors.grey.withOpacity(0.3))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                // color: Colors.red,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      NetworkImage(cartList[index].thumbnailImage.toString()),
                  // child: Image.network(cartList[index].thumbnailImages),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 150,
                // color: Colors.red,
                child: Text(
                  cartList[index].title.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 90,
            // color: Colors.red,
            child: Text(
              "Rs.${cartList[index].price.toString()}",
              // ignore: prefer_const_constructors
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            height: 40,
            width: 100,
            // color: Colors.red,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.grey, width: 0.2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (cartList[index].itemQuantity > 1) {
                      cartController.decrementCartItem(
                          type: cartList[index].type,
                          productId: cartList[index].id,
                          customerId: storage.read("loggedUserDetails")["id"]);
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                Text(
                  cartList[index].itemQuantity.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      // print(cartList[index].type);
                      cartController.incrementCartItem(
                          productId: cartList[index].id,
                          type: cartList[index].type,
                          customerId: storage.read("loggedUserDetails")["id"]);

                      /* cartList[index].itemQuantity++;
                                            cartController.subTotal = (cartList[index].price +
                                                cartController.subTotal);*/
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 90,
              child: Text(
                "Rs.${(cartList[index].itemQuantity * cartList[index].price).toString()}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          SizedBox(
            height: 50,
            width: 30,
            child: InkWell(
              onTap: () {
                cartController.deleteProductFromCart(
                    type: cartList[index].type,
                    productId: cartList[index].id,
                    customerId: storage.read("loggedUserDetails")["id"]);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateCart() {
    // print("cart will be update by api ..");
    // print(data);
  }
}
