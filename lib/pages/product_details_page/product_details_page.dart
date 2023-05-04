import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/product_details_page/product_details_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var selectedOption = "7 Size UK";
  ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();

// TabController tabColtroller=TabController(length: 4, vsync: vsync)
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
  final List<Map> sectionList = [
    {
      "title": "100% Original",
      "image": "images/icon01.png",
      "des": "From Brand",
    },
    {
      "title": "Chat Support",
      "image": "images/chat.png",
      "des": "For Queries",
    },
    {
      "title": "Free Delivery",
      "image": "images/delivery.png",
      "des": "Most Brands",
    },
    {
      "title": "Exchange",
      "image": "images/exchange.png",
      "des": "Brand Policy",
    },
    {
      "title": "Earn GALF Coins",
      "image": "images/coin.png",
      "des": "On Every Order",
    },
    {
      "title": "GST Invoice",
      "image": "images/gst2.png",
      "des": "For Companies",
    },
  ];

  @override
  void initState() {
    super.initState();
    final id = Get.parameters["id"];
    print(id);
    // Get.snackbar(id.toString(), id.toString());
    Future.delayed(Duration.zero, () {
      productDetailsController.fetchProducts(id);
    });
  }

  // @override
  final CartController _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
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
              Navbar(currentScreen: currentScreen, selected: 'productDetails'),
        ),
        body: Obx(() => SizedBox(
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                children: [
                  currentRoute(context: context),
                  productDetailsController.isLoading == true
                      ? myLoader
                      : productDetailsController.productDetailsData.isEmpty
                          ? myemptyDataView(context: context)
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                ProductView(
                                    context: context,
                                    selectedOption: selectedOption,
                                    sectionList: sectionList),
                                const SizedBox(
                                  height: 20,
                                ),
                                ProductExtraDetails(context: context),
                                SuggestProductCarouser(
                                    context: context,
                                    scrollController: scrollController,
                                    myProducts: myProducts),
                              ],
                            ),
                  Footer(context: context)
                ],
              ),
            )));
  }

  Widget ProductExtraDetails({required context}) {
    return DefaultTabController(
      length: 4,
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 241, 239, 239)),
          child: UnconstrainedBox(
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              child: const TabBar(
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.blue,
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Product Details"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Refund Policy"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Reviews"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Technical Information"),
                    ),
                  ),
                  // Tab(
                  //   child: SizedBox(
                  //     width: 150,
                  //     child: Center(
                  //       child: Text(
                  //         "Recycled",
                  //         style: TextStyle(color: Colors.white),
                  //         // textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Tab(
                  //   child: SizedBox(
                  //     width: 150,
                  //     // height: 70,
                  //     // color: Colors.blue,
                  //     child: Center(
                  //       child: Text(
                  //         "Product Details",
                  //         style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  //         // textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Tab(
                  //   child: SizedBox(
                  //     width: 150,
                  //     // height: 70,
                  //     // color: Colors.blue,
                  //     child: Center(
                  //       child: Text(
                  //         "Reviews",
                  //         style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  //         // textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Tab(
                  //   child: SizedBox(
                  //     width: 150,
                  //     // height: 70,
                  //     // color: Colors.blue,
                  //     child: Center(
                  //       child: Text(
                  //         "Technical Information",
                  //         style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  //         // textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 150),
            decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 164, 93, 93)

                ),
            child: TabBarView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      otherInfo(context: context),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        productDetailsController
                            .productDetailsData[0].description
                            .toString(),
                        maxLines: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /* Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Color",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Inner material",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Outer material",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ideal for",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Occasion",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sole material",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Artic Blue",
                          style: TextStyle(color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Comfort Foam",
                          style: TextStyle(color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Synthetic Leather",
                          style: TextStyle(color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Men",
                          style: TextStyle(color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sports",
                          style: TextStyle(color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Airmix",
                          style: TextStyle(color: Color(0xFF1C4A64)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                  ),*/
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(productDetailsController
                      .productDetailsData[0].refundPolicy
                      .toString()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a. "),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a. "),
                ),
              ],
            ))
      ]),
    );
  }

  Widget currentRoute({required context}) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: mainThemeColor,
            child: Row(
              children: const [
                SizedBox(
                  width: 150,
                ),
                Text(
                  "HOME   >   MYGALF   >   RUNNING SHOES FOR MEN",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          color: Colors.blue,
        )
      ],
    );
  }

  Widget ProductView(
      {required context, required selectedOption, required sectionList}) {
    return UnconstrainedBox(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        // height: 900,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width * 0.7) * 0.5,
              // height: 1000,
              // color: Colors.yellow,
              child: Column(
                children: [
                  leftSideImage(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ...productDetailsController.productDetailsData[0].productImages
                    .map((dynamic val) { 
                      return InkWell(
                         onTap: () {
                productDetailsController.imageChage(image: val["image"]);
                
               
                       },
                        child: Container( 
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              // color: Colors.red,
                              image:  DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(val["image"])
                                      )),
                          width: 64,
                          height: 64,
                        ),
                      );
                    }).toList(),
                      
                    ],
                  ),
                ],
              ),
            ),

            //!  details section------------------------------------------
            Container(
              width: (MediaQuery.of(context).size.width * 0.8) * 0.5,
              padding: const EdgeInsets.all(5),
              // height: 800,
              // color: Color.fromARGB(255, 143, 140, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width:
                        ((MediaQuery.of(context).size.width * 0.9) * 0.5) * 0.8,
                    child: Text(
                      productDetailsController.productDetailsData[0].title
                          .toString(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: ((MediaQuery.of(context).size.width * 0.9) * 0.5) *
                          0.8,
                      child: Text(
                        productDetailsController
                            .productDetailsData[0].shortDescription
                            .toString(),
                        textAlign: TextAlign.start,
                        maxLines: 5,
                        softWrap: true,
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: ((MediaQuery.of(context).size.width * 0.8) * 0.5),
                      child: Row(
                        //
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                productDetailsController.productDetailsData[0]
                                            .discountedPrice !=
                                        null
                                    ? Text(
                                        "₹ ${productDetailsController.productDetailsData[0].discountedPrice.toString()}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 26,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : Text(
                                        "₹ ${productDetailsController.productDetailsData[0].price.toString()}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 26,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                const SizedBox(
                                  width: 5,
                                ),
                                productDetailsController.productDetailsData[0]
                                            .discountedPrice !=
                                        null
                                    ? Text(
                                        "MRP ${productDetailsController.productDetailsData[0].price.toString()}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF979797),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  width: 5,
                                ),
                                productDetailsController.productDetailsData[0]
                                            .discountedPrice !=
                                        null
                                    ? Text(
                                        "${productDetailsController.calculateDiscount(discountedPrice: productDetailsController.productDetailsData[0].discountedPrice.toString(), mrp: productDetailsController.productDetailsData[0].price.toString())} % off",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF3c763d),
                                            fontWeight: FontWeight.w400),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          /*  Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "2.75",
                                style: TextStyle(
                                    color: Color(0xFF1C4A64),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RatingBarIndicator(
                                rating: 2.75,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Color(0xFF1C4A64),
                                ),
                                itemCount: 5,
                                itemSize: 20,
                                direction: Axis.horizontal,
                              ),
                            ],
                          )
                          ),*/
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),

                  ...productDetailsController
                      .productDetailsData[0].availableOfferListArr
                      .map((dynamic data) {
                    return offerSection(
                        context: context,
                        couponCode: data['couponCode'],
                        discountedPrice: data['discountedPrice']);
                  }).toList(),

                  // offerSection1(context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: ((MediaQuery.of(context).size.width * 0.6) * 0.5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 246, 246),
                        border: Border.all(width: 0.5, color: Colors.black)),
                    child: Text(
                      "PAY USING : EMI | Credit/Debit Cards | UPI | Net Banking | Wallets | Rewards",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(fontSize: 12),
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 100,
                    width: ((MediaQuery.of(context).size.width * 0.8) * 0.5),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: sectionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return otherSection(context: context, index: index);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 41, 94, 137))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                productDetailsController.quantity > 1
                                    ? productDetailsController.quantity--
                                    : null;
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 41, 94, 137),
                                ),
                              ),
                            ),
                            Text(
                              productDetailsController.quantity.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 41, 94, 137),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                productDetailsController.quantity++;
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 41, 94, 137),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.1,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: const Color.fromARGB(255, 41, 94, 137),
                          )),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            value: selectedOption,
                            offset: const Offset(-20, -10),
                            dropdownWidth: 400,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 41, 94, 137),
                                overflow: TextOverflow.ellipsis),
                            items: const [
                              DropdownMenuItem(
                                value: '7 Size UK',
                                child: Text(
                                  '7 Size UK',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 41, 94, 137),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: '8 Size UK',
                                child: Text(
                                  '8 Size UK',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 41, 94, 137),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: '9 Size UK',
                                child: Text(
                                  '9 Size UK',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 41, 94, 137),
                                  ),
                                ),
                              )
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                selectedOption = newValue;
                              });
                            },
                          ))),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 41, 94, 137),
                                minimumSize: const Size(150, 49),
                              ),
                              onPressed: () {
                                productDetailsController.handleAddtoCart(
                                    context: context,
                                    cartController: _cartController,
                                    id: Get.parameters["id"]);
                              },
                              icon: const Icon(Icons.local_mall_outlined),
                              label: const Text("Add to cart")),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SuggestProductCarouser(
      {required context, required scrollController, required myProducts}) {
    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width,
      // color: Colors.blue,

      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "YOU MAY ALSO LIKE",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C4A64),
            ),
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
                  itemCount: myProducts.length,
                  itemBuilder: (context, index) {
                    return productCard(myProducts: myProducts, index: index);
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

  Widget productCard({
    required myProducts,
    required index,
  }) {
    return MouseRegion(
      onEnter: (event) {
        //print(event);
      },
      onExit: (event) {},
      child: Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        width: 287,
        height: 467,
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  myProducts[index]['image'],
                ))),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              myProducts[index]['title'],
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C4A64)),
            ),
            const SizedBox(
              height: 4,
            ),
            const SizedBox(
              width: 250,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                maxLines: 2,
                style: TextStyle(
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
                  "2.75",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                const SizedBox(
                  width: 5,
                ),
                RatingBarIndicator(
                  rating: 2.75,
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
              children: const [
                Text("₹1250",
                    style: TextStyle(
                        color: Color(0xFF1C4A64),
                        fontWeight: FontWeight.w500,
                        fontSize: 25)),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "₹2,499",
                  style: TextStyle(
                      color: Color(0xFF1C4A64),
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  "(50% Off)",
                  style: TextStyle(
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

  Widget offerSection1({required context}) {
    return Row(
      children: [
        const Icon(
          Icons.sell,
          color: Color(0xFF58bf48),
          size: 15.0,
        ),
        RichText(
          text: const TextSpan(
            text: 'Offer: ',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: 'Use Code APRIL2023  on checkout to avail price',
                  style: TextStyle(fontSize: 13, color: Colors.black)),
              TextSpan(
                  text: ' Rs 65099/-',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        )
      ],
    );
  }

  Widget offerSection(
      {required context, required couponCode, required discountedPrice}) {
    return Row(
      children: [
        const Icon(
          Icons.sell,
          color: Color(0xFF58bf48),
          size: 15.0,
        ),
        RichText(
          text: TextSpan(
            text: 'Offer: ',
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: 'Use Code $couponCode  on checkout to avail price',
                  style: const TextStyle(fontSize: 13, color: Colors.black)),
              TextSpan(
                  text: ' Rs $discountedPrice/-',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        )
      ],
    );
  }

  Widget otherSection({required context, required index}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Image(
              width: 45,
              image: AssetImage(sectionList[index]["image"].toString())),
          Text(
            sectionList[index]["title"].toString(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(sectionList[index]["des"].toString(),
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic))
        ],
      ),
    );
  }

  Widget otherInfo({required context}) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Sold By :",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 22, 23)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Category",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 22, 23)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Country",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 22, 23)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Shipping Charges",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 22, 23)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Delivery",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 22, 23)),
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productDetailsController.productDetailsData[0].vendorDetails !=
                        null
                    ? productDetailsController
                        .productDetailsData[0].vendorDetails['name']
                        .toString()
                    : '',
                style: TextStyle(color: Color(0xFF1C4A64)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Comfort Foam",
                style: TextStyle(color: Color(0xFF1C4A64)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                productDetailsController.productDetailsData[0].country != null
                    ? productDetailsController
                        .productDetailsData[0].country['name']
                        .toString()
                    : 'NA',
                style: TextStyle(color: Color(0xFF1C4A64)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                productDetailsController.productDetailsData[0].shippingCost.toString(),
                style: TextStyle(color: Color(0xFF1C4A64)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(productDetailsController.productDetailsData[0].delivery.toString(),
                style: TextStyle(color: Color(0xFF1C4A64)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget leftSideImage() {
    return SizedBox(
      height: 401,
      child: Container(
        width: (MediaQuery.of(context).size.width * 0.7) * 0.5,
        // color: Colors.red,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 164, 161, 161), width: 0.5),
            // color: Colors.red,
            image:  DecorationImage(
                fit: BoxFit.fill,
               // image: AssetImage("assets/images/pdp_image1.png")
                  image: NetworkImage(productDetailsController.selectedImage.value)
                )),
        height: 400,
      ),
    );
  }
}
