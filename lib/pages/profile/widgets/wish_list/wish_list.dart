import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wish_list_controller.dart';

class WishList extends StatefulWidget {
  WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistController _wishListController = Get.put(WishlistController());

  @override
  void initState() {
    super.initState();
    _wishListController.fetchWishList();
  }

  List wishData = [
    {
      "id": 01,
      "title": "Tacx-Tacx item",
      "image": "assets/images/tacx_body.png",
      "price": 1200
    },
    {
      "id": 02,
      "title": "Soucony",
      "image": "assets/images/whey_fst.png",
      "price": 1400
    },
    {
      "id": 03,
      "title": "CC-Adventure",
      "image": "assets/images/triathlon.png",
      "price": 1600
    },
    {
      "id": 04,
      "title": "First & Up",
      "image": "assets/images/shoe.png",
      "price": 1100
    },
    {
      "id": 05,
      "title": "Coros",
      "image": "assets/images/nutrition.png",
      "price": 1300
    },
    {
      "id": 06,
      "title": "Tacx",
      "image": "assets/images/pdp_image1.png",
      "price": 900
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 500,
      padding: const EdgeInsets.all(15),
      width: Get.width,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        runSpacing: 30,
        children: [...wishData.map((e) => _wishListproduct(e))],
      ),
    );
  }

  Widget _wishListproduct(data) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(88, 158, 158, 158),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]),
      width: 350,
      height: 100,
      child: ListTile(
        title: Text(
          data['title'],
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF1A3E4E)),
        ),
        subtitle: Text(
          "₹" + data['price'].toString(),
          style: TextStyle(color: Colors.green),
        ),
        trailing: InkWell(
          onTap: () {
            wishData.remove(data.index);
            setState(() {});
          },
          child: const Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
          ),
        ),
        leading: CircleAvatar(
          foregroundImage: AssetImage(data['image']),
        ),
      ),
    );
  }
}
