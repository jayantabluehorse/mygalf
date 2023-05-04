import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_galf/pages/product_page/product_controller.dart';

class SuggestItems extends StatelessWidget {
  final List<Map> myProducts = [
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/running_shoes_men.png",
    },
    {
      "title": "Running Watch For Men",
      "image": "assets/images/running_watch_men.png"
    },
    {"title": "Running Watch For Men", "image": "assets/images/fast_up.png"},
    {"title": "Running Watch For Men", "image": "assets/images/hand.png"},
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/running_shoes_men.png"
    },
    {
      "title": "Running Watch For Men",
      "image": "assets/images/running_watch_men.png"
    },
    {"title": "Running Watch For Men", "image": "assets/images/fast_up.png"},
    {"title": "Running Watch For Men", "image": "assets/images/hand.png"},
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/running_shoes_men.png"
    },
    {
      "title": "Running Watch For Men",
      "image": "assets/images/running_watch_men.png"
    },
    {"title": "Running Watch For Men", "image": "assets/images/fast_up.png"},
    {"title": "Running Watch For Men", "image": "assets/images/hand.png"}
  ];

  final ProductController _productController = Get.find<ProductController>();
  SuggestItems({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return suggestProductCarouser(
        context: context,
        scrollController: scrollController,
        myProducts: myProducts);
  }

  Widget suggestProductCarouser(
      {required context, required scrollController, required myProducts}) {
    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width,
      // color: Colors.blue,

      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "YOU MAY ALSO LIKE",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C4A64),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  scrollController.animateTo(
                    scrollController.offset - 300.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                // color: Colors.green,
                height: 400,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _productController.productList.length,
                  itemBuilder: (context, index) {
                    return productCard(
                        myProducts: _productController.productList,
                        index: index);
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  scrollController.animateTo(
                    scrollController.offset + 300.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  ///
  ///
  ///
  //
  Widget productCard({
    required myProducts,
    required index,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed("/products/${myProducts[index].id}");
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        width: 287,
        height: 467,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2))),
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(
                myProducts[index].thumbnailImage.toString(),
              ))),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              myProducts[index].title.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C4A64)),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 250,
              child: Text(
                myProducts[index].shortDescription ?? "",
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1C4A64)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "4.0",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                const SizedBox(
                  width: 5,
                ),
                RatingBarIndicator(
                  rating: 4.0,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    myProducts[index].specialPrice ??
                        myProducts[index].price.toString(),
                    style: const TextStyle(
                        color: Color(0xFF1C4A64),
                        fontWeight: FontWeight.w500,
                        fontSize: 25)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  myProducts[index].price.toString(),
                  style: const TextStyle(
                      color: Color(0xFF1C4A64),
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  "(${myProducts[index].discountPercent}% Off)",
                  style: const TextStyle(
                      color: Color(0xFF28C969),
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
