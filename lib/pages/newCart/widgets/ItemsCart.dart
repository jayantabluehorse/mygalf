import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/newCart/constants/constrants.dart';
import 'package:get_storage/get_storage.dart';

class cartItem extends StatelessWidget {
  final CartController _cartController = Get.find<CartController>();
  final getTotalPrice;
  final storage = GetStorage();
  List items = [
    {
      "brand": "Forclaz",
      "name": "Travel Shoe UK-7 -black",
      "price": "1299",
      "orginalPrice": "1500",
      "quantity": 1,
      "image": "assets/images/shoe.png"
    },
    {
      "brand": "Plaza",
      "name": "Nutrition- 2L",
      "price": "1099",
      "orginalPrice": "1200",
      "quantity": 2,
      "image": "assets/images/nutrition.png"
    },
    {
      "brand": "Tacx Body",
      "name": "traxy body -1",
      "price": "15000",
      "orginalPrice": "18000",
      "quantity": 1,
      "image": "assets/images/tacx_body.png"
    },
    {
      "brand": "Forclaz",
      "name": "Travel Shoe UK-7 -black",
      "price": "1299",
      "orginalPrice": "1500",
      "quantity": 1,
      "image": "assets/images/shoe.png"
    },
    {
      "brand": "Plaza",
      "name": "Nutrition- 2L",
      "price": "1099",
      "orginalPrice": "1200",
      "quantity": 2,
      "image": "assets/images/nutrition.png"
    },
  ];

  cartItem({super.key, required this.getTotalPrice});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeiht = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.white),
      width: currentWidth / 2,
      // height: currentHeiht / 1.5,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1.5)),
            ),
            height: 30,
            child: Row(
              children: const [
                Text(
                  "Items  in  Cart",
                  style: cartTheme.cartHeading2,
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: currentHeiht / 1.8,
            width: currentWidth / 1.2,
            child: ListView.builder(
              itemCount: _cartController.cartList.length,
              itemBuilder: (context, index) {
                return storage.read("loggedUserDetails") == null &&
                        _cartController.cartList.isNotEmpty
                    ? _itemCardForLocal(context: context, index: index)
                    : _itemCard(context: context, index: index);
              },
            ),

            // ListView(
            //   children: [
            //     ..._cartController.cartList.map((e) =>
            //         storage.read("loggedUserDetails") == null &&
            //                 _cartController.cartList.isNotEmpty
            //             ? _item(e)
            //             : const SizedBox())
            //   ],
            // ),
          )
        ],
      ),
    );
  }

  Widget _itemCardForLocal({required index, required context}) {
    Color color = Colors.black;
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // width: 300,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 234, 236, 238),
                  foregroundImage: NetworkImage(
                      _cartController.cartList[index]['thumbnailImage']),
                  radius: 35,
                ),
                const SizedBox(width: 20),
                SizedBox(
                  // width: 300,
                  width: MediaQuery.of(context).size.width * 0.25,
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _cartController.cartList[index]['title'],
                        // softWrap: true,
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // overflow: ,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      // Text(_cartController.cartList[index]['shortDescription']
                      //         .toString() ??
                      //     ""),
                      // const SizedBox(height: 3),
                      SizedBox(
                          child: Row(
                        children: [
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "₹" +
                                _cartController.cartList[index]['specialPrice'],
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "₹" + _cartController.cartList[index]['price'],
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.grey, width: 0.2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    var temp = storage.read("cart");
                    if (temp[index]["itemQuantity"] > 1) {
                      temp[index]["itemQuantity"]--;
                      storage.write("cart", temp);
                      _cartController.cartList([...temp]);
                      getTotalPrice();
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                Text(
                  _cartController.cartList[index]["itemQuantity"].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      var temp = storage.read("cart");
                      temp[index]["itemQuantity"]++;
                      storage.write("cart", temp);
                      _cartController.cartList([...temp]);
                      getTotalPrice();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          // SizedBox(width: 150),
          InkWell(
              onTap: () {
                var temp = storage.read("cart");
                var currPrice = _cartController.subTotal -
                    (double.parse(temp[index]["price"]).toInt());
                _cartController.subTotal = currPrice;
                temp.removeAt(index);
                storage.write("cart", temp);
                _cartController.cartList([...temp]);
              },
              child: Icon(
                Icons.delete,
                color: color,
              ))
        ],
      ),
    );
  }

  Widget _itemCard({required index, required context}) {
    Color color = Colors.black;
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // width: 300,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 234, 236, 238),
                  foregroundImage: NetworkImage(
                      _cartController.cartList[index].thumbnailImages),
                  radius: 35,
                ),
                const SizedBox(width: 20),
                SizedBox(
                  // width: 300,
                  width: MediaQuery.of(context).size.width * 0.25,
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _cartController.cartList[index].title.toString(),
                        // softWrap: true,
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // overflow: ,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      // Text(_cartController.cartList[index].shortDescription
                      //         .toString() ??
                      //     ""),
                      // const SizedBox(height: 3),
                      SizedBox(
                          child: Row(
                        children: [
                          Text(
                            "₹${_cartController.cartList[index].specialPrice.toString() == "0.00" || _cartController.cartList[index].specialPrice.toString() == "" ? _cartController.cartList[index].price.toString() : _cartController.cartList[index].specialPrice.toString()}",
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "₹${_cartController.cartList[index].price.toString()}",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
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
                    //   _cartController.cartList([...temp]);
                    //   getTotalPrice();
                    // }
                    if (_cartController.cartList[index].itemQuantity > 1) {
                      _cartController.decrementCartItem(
                          type: _cartController.cartList[index].type,
                          productId: _cartController.cartList[index].id,
                          customerId: storage.read("loggedUserDetails")["id"]);
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                Text(
                  _cartController.cartList[index].itemQuantity.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
                      _cartController.incrementCartItem(
                          productId: _cartController.cartList[index].id,
                          type: _cartController.cartList[index].type,
                          customerId: storage.read("loggedUserDetails")["id"]);
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ),
          // SizedBox(width: 150),
          InkWell(
              onTap: () {
                _cartController.deleteProductFromCart(
                    type: _cartController.cartList[index].type,
                    productId: _cartController.cartList[index].id,
                    customerId: storage.read("loggedUserDetails")["id"]);
              },
              child: Icon(
                Icons.delete,
                color: color,
              ))
        ],
      ),
    );
  }
}
