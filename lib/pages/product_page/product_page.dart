import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/components/product_card.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/product_details_page/product_details_controller.dart';
import 'package:my_galf/pages/product_page/product_controller.dart';

import '../../components/request_callback/request_callback.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currenIndex = -1;
  ProductController productController = Get.find<ProductController>();
  ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();
  final CartController _cartController = Get.find<CartController>();
  bool isAllItem = false;

  final ScrollController _scrollController = ScrollController();

  bool isCategory = true;
  void typeHandler(type) {
    setState(() {
      isCategory = type;
    });
  }

  void updateLocation(index) {
    setState(() {
      currenIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero, () async {
    //   productController.fetchProducts();
    // });

    // Future.delayed(Duration.zero, () {
    //   productController.fetchProducts();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // print("------------------------------${productController.productList}");
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 500
            ? "small"
            : currentWidth >= 500 && currentWidth <= 1100
                ? "medium"
                : "big";
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("$currentWidth"),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 115,
          elevation: 0,
          flexibleSpace:
              Navbar(currentScreen: currentScreen, selected: 'products'),
        ),
        body: Stack(
          children: [
            Obx(
              () => Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: ListView(children: [
                    //navbar is component

                    productHeroCarousel(
                        context: context,
                        scrollController: _scrollController,
                        isCategory: isCategory,
                        typeHandler: typeHandler),
                    const SizedBox(
                      height: 20,
                    ),
                    productFilter(context: context),
                    const SizedBox(
                      height: 50,
                    ),
                    productList(
                        updateLocation: updateLocation,
                        myProducts: productController.productList,
                        currenIndex: currenIndex),
                    Footer(context: context)
                  ])),
            ),
            const RequestCallback()
          ],
        ));
  }

  Widget productFilter({required context}) {
    return UnconstrainedBox(
      child: SizedBox(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(isCategory ? "Shop By Category " : "Shop By Brand",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const FittedBox(
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF585858)),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "data", child: Text("Male")),
                            DropdownMenuItem(
                                value: "data1", child: Text("Female")),
                            DropdownMenuItem(
                                value: "data2", child: Text("Other")),
                          ],
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const FittedBox(
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF585858)),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "data", child: Text("999-299")),
                            DropdownMenuItem(
                                value: "data1", child: Text("2999-5999")),
                            DropdownMenuItem(
                                value: "data2", child: Text("5999 and Above")),
                          ],
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const FittedBox(
                            child: Text(
                              "Brand",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF585858)),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "data", child: Text("Brand 1")),
                            DropdownMenuItem(
                                value: "data1", child: Text("Brand 2")),
                            DropdownMenuItem(
                                value: "data2", child: Text("Brand 3")),
                          ],
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const FittedBox(
                            child: Text(
                              "Color",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF585858)),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(value: "data", child: Text("Red")),
                            DropdownMenuItem(
                                value: "data1", child: Text("Green")),
                            DropdownMenuItem(
                                value: "data2", child: Text("Blue")),
                          ],
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 40,
                  //     child: ElevatedButton(
                  //         onPressed: () {}, child: const Text("Apply")),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productHeroCarousel(
      {required context,
      required scrollController,
      required isCategory,
      required typeHandler}) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      // color: Colors.blue,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/product_hero.png"))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isCategory ? "Shop By Category " : "Shop By Brand",
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus, mauris a aliquet\ncongue, elit quam ultrices odio, quis fermentum odio augue ac tellus.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black),
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
                  padding: const EdgeInsets.only(left: 6),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(color: Colors.black)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              isCategory
                  ? SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.categoryData.length,
                        //  isCategory ? "Shop By Category " : "Shop By Brand"
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // print(
                              // productController.categoryData[index]["id"]);

                              productController.handleFilter(
                                  brandId: "",
                                  gender: "",
                                  categoryId: productController
                                      .categoryData[index]["id"],
                                  color: "");
                            },
                            child: Container(
                              // color: Colors.red,
                              // color: Colors.green,
                              width: 140,
                              margin: const EdgeInsets.only(right: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.network(
                                        productController.categoryData[index]
                                            ["image"],
                                        width: 100,
                                      ),
                                    ),
                                    // backgroundImage: NetworkImage(
                                    //     productController.categoryData[index]
                                    //         ["image"]),
                                    // child: Image.network(
                                    //   // "assets/images/shoe.png",
                                    //   productController.categoryData[index]
                                    //       ["image"],
                                    //   width: 80,
                                    // ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      productController.categoryData[index]
                                          ["title"],
                                      maxLines: 1,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      //  color: Colors.green,

                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.brandData.length,
                        //  isCategory ? "Shop By Category " : "Shop By Brand"
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              productController.handleFilter(
                                  brandId: productController.brandData[index]
                                      ["id"],
                                  gender: "",
                                  categoryId: "",
                                  color: "");
                            },
                            child: Container(
                              width: 140,
                              margin: const EdgeInsets.only(right: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,

                                    child: Image.network(
                                      productController.brandData[index]
                                          ["image"],
                                      width: 80,
                                    ),
                                    // backgroundImage: NetworkImage(

                                    //     productController.brandData[index]
                                    //         ["image"])
                                    // child: Image.network(
                                    //   // "assets/images/shoe.png",
                                    //   productController.brandData[index]
                                    //       ["image"],
                                    //   width: 80,
                                    // ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      productController.brandData[index]
                                          ["title"],
                                      maxLines: 1,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              const SizedBox(
                width: 15,
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
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isCategory ? Colors.orange : Colors.white),
                    onPressed: () {
                      typeHandler(true);
                    },
                    child: Text(
                      "Shop By Categories",
                      style: TextStyle(
                          color: isCategory ? Colors.white : Colors.black),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isCategory ? Colors.white : Colors.orange),
                    onPressed: () {
                      typeHandler(false);
                    },
                    child: Text(
                      "Shop By Brand",
                      style: TextStyle(
                          color: isCategory ? Colors.black : Colors.white),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget productList(
      {required updateLocation, required myProducts, required currenIndex}) {
    return UnconstrainedBox(
      child: Container(
          // height: 1600,
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.white,
          margin: const EdgeInsets.only(left: 25, right: 25),
          // color: Colors.amber,
          child: Column(
            children: [
              productController.isLoading == true
                  ? myLoader
                  : productController.productList.isEmpty
                      ? myemptyDataView(context: context)
                      : GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  //maxCrossAxisExtent: 200,
                                  //childAspectRatio: 1,
                                  mainAxisExtent: 457,
                                  crossAxisSpacing: 40,
                                  crossAxisCount: 4,
                                  childAspectRatio: 1.2 / 2.0,
                                  mainAxisSpacing: 50),
                          itemCount: isAllItem
                              ? productController.productList.length
                              : productController.productList.length > 16
                                  ? 16
                                  : productController.productList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: ProductCard(
                                myProducts: myProducts,
                                index: index,
                                updateLocation: updateLocation,
                                currenIndex: currenIndex,
                                cartController: _cartController,
                                productController: productController,
                              ),
                            );
                          }),
              const SizedBox(
                height: 20,
              ),
              productController.productList.length < 16 && !isAllItem
                  ? const SizedBox()
                  : SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isAllItem = true;
                          });
                        },
                        child: const Text("Load More"),
                      ),
                    )
            ],
          )),
    );
  }
}
