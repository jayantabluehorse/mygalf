import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:get/get.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:my_galf/pages/service_details_page/service_details_controller.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({super.key});

  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  final ServiceDetailsController _serviceDetailsController =
      Get.find<ServiceDetailsController>();
  final CartController cartController = Get.find<CartController>();
  String dropdownValue = list[0];
  var selection = "desc";
  bool isLoading = true;

  bool descSelect = true;
  bool refundPolicy = false;
  bool panelList = false;

  testFun(val) {
    setState(() {
      selection = val;
    });
  }

  String calculateDiscount({required mrp, required discountedPrice}) {
    mrp = double.parse(mrp);
    discountedPrice = double.parse(discountedPrice);

    var discount = mrp - discountedPrice;

    double discountRate = (discount / mrp) * 100;
    return discountRate.toStringAsFixed(2);
  }

  @override
  void initState() {
    super.initState();
    final id = Get.parameters["id"];

    Future.delayed(Duration.zero, () {
      _serviceDetailsController.fetchData(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("[[[[[]]]]]${_serviceDetailsController.serviceDetailsData}");
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
              Navbar(currentScreen: currentScreen, selected: 'service'),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => _serviceDetailsController.isLoading == true
              ? myLoader
              : _serviceDetailsController.serviceDetailsData.isEmpty
                  ? myemptyDataView(context: context)
                  : SizedBox(
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          // ElevatedButton(
                          //     onPressed: () {
                          //       print(
                          //           "][[[[[]]]]]${_serviceDetailsController.serviceDetailsData[0].session}");
                          //     },
                          //     child: Text(_serviceDetailsController.servicePrice
                          //         .toString())),
                          //navbar is component
                          // Navbar(currentScreen: currentScreen),
                          currentRoute(context: context),
                          const SizedBox(
                            height: 50,
                          ),
                          productView(
                            context: context,
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          serviceExtraDetails(
                            context: context,
                            // testFun: testFun,
                            // selection: selection,
                          ),
                          suggestProductCarouser(
                            context: context,
                            scrollController: scrollController,
                          ),

                          Footer(context: context)
                        ],
                      )),
        ));
  }

  // Widget ProductExtraDetails({
  //   required context,
  //   required testFun,
  //   required selection,
  // }) {
  //   double tempWidth = (MediaQuery.of(context).size.width);
  //   bool changes = false;
  //   if (tempWidth <= 950) {
  //     changes = true;
  //   }
  //   const descData =
  //       " Desc Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a.";
  //   const rpData =
  //       " refund Plicy Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a.";
  //   const plData =
  //       " panel data Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a.";
  //   return Column(children: [
  //     //nav
  //     Container(
  //         height: 60,
  //         color: const Color.fromARGB(255, 241, 239, 239),
  //         child: Row(
  //           children: [
  //             Container(
  //               alignment: Alignment.centerRight,
  //               padding: changes
  //                   ? const EdgeInsets.only(left: 0)
  //                   : const EdgeInsets.only(left: 300),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   InkWell(
  //                     child: Container(
  //                         padding: const EdgeInsets.all(5),
  //                         alignment: Alignment.center,
  //                         color: descSelect ? Colors.blue : null,
  //                         height: 60,
  //                         width: 200,
  //                         child: Text(
  //                           "description".toUpperCase(),
  //                           style: GoogleFonts.rubik(
  //                               textStyle: TextStyle(
  //                                   color: descSelect
  //                                       ? Colors.white
  //                                       : Colors.black)),
  //                         )),
  //                     onHover: (value) {
  //                       // print(value);
  //                     },
  //                     onTap: () {
  //                       testFun("desc");
  //                       setState(() {
  //                         descSelect = true;
  //                         refundPolicy = false;
  //                         panelList = false;
  //                       });
  //                     },
  //                   ),
  //                   InkWell(
  //                     child: Container(
  //                       padding: const EdgeInsets.all(5),
  //                       alignment: Alignment.center,
  //                       color: refundPolicy ? Colors.blue : null,
  //                       height: 60,
  //                       width: 200,
  //                       child: Text("Refund Policy".toUpperCase(),
  //                           style: GoogleFonts.rubik(
  //                               textStyle: TextStyle(
  //                                   color: refundPolicy
  //                                       ? Colors.white
  //                                       : Colors.black))),
  //                     ),
  //                     onTap: () {
  //                       testFun("refund policy");
  //                       setState(() {
  //                         descSelect = false;
  //                         refundPolicy = true;
  //                         panelList = false;
  //                       });
  //                     },
  //                   ),
  //                   InkWell(
  //                     child: Container(
  //                       padding: const EdgeInsets.all(5),
  //                       alignment: Alignment.center,
  //                       height: 60,
  //                       width: 200,
  //                       color: panelList ? Colors.blue : null,
  //                       child: Text("panelist".toUpperCase(),
  //                           style: GoogleFonts.rubik(
  //                               textStyle: TextStyle(
  //                                   color: panelList
  //                                       ? Colors.white
  //                                       : Colors.black))),
  //                     ),
  //                     onTap: () {
  //                       testFun("panel list");
  //                       setState(() {
  //                         descSelect = false;
  //                         refundPolicy = false;
  //                         panelList = true;
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         )),
  //     //content

  //     Container(
  //       height: 250,
  //       // width: 1000,
  //       padding: changes
  //           ? const EdgeInsets.fromLTRB(10, 10, 10, 10)
  //           : const EdgeInsets.fromLTRB(300, 50, 0, 50),
  //       child: Text(
  //         selection == "desc"
  //             ? descData
  //             : selection == "panel list"
  //                 ? plData
  //                 : rpData,
  //         style: const TextStyle(fontSize: 18),
  //       ),
  //     )
  //   ]);
  // }

  Widget suggestProductCarouser({
    required context,
    required scrollController,
  }) {
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
            "RELATED PRODUCTS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C4A64),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _serviceDetailsController
                          .serviceDetailsData[0].relatedProducts.length >
                      3
                  ? InkWell(
                      onTap: () {
                        scrollController.animateTo(
                          scrollController.offset - 300.0,
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
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                // color: Colors.green,

                height: 400,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _serviceDetailsController
                      .serviceDetailsData[0].relatedService.length,
                  itemBuilder: (context, index) {
                    return productCard(
                      myProduct: _serviceDetailsController
                          .serviceDetailsData[0].relatedService[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              _serviceDetailsController
                          .serviceDetailsData[0].relatedProducts.length >
                      3
                  ? InkWell(
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
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget productCard({
    required myProduct,
  }) {
    return MouseRegion(
      onEnter: (event) {
        //print(event);
      },
      onExit: (event) {},
      child: InkWell(
        onTap: () {
          Get.toNamed("/service-details/${myProduct["id"].toString()}");
        },
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
                          image: NetworkImage(
                    myProduct['mainImage'],
                  ))),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                myProduct['name'],
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
                  myProduct["shortDescription"],
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
                children: [
                  Text("₹${myProduct["discountedPrice"]}",
                      style: const TextStyle(
                          color: Color(0xFF1C4A64),
                          fontWeight: FontWeight.w500,
                          fontSize: 25)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "₹${myProduct["price"]}",
                    style: const TextStyle(
                        color: Color(0xFF1C4A64),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10),
                  ),
                  Text(
                    "${calculateDiscount(discountedPrice: myProduct["discountedPrice"], mrp: myProduct["price"]).toString()}% off",
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
      ),
    );
  }

  Widget productView({
    required context,
  }) {
    double tempWidth = (MediaQuery.of(context).size.width);
    bool changes = false;
    if (tempWidth <= 950) {
      changes = true;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // width: (MediaQuery.of(context).size.width * 0.7) * 0.5,
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  _serviceDetailsController.serviceDetailsData[0].mainImage),
            ),
          ),
          height: 500,
          width: 430,
        ),
        const SizedBox(
          width: 70,
        ),
        Container(
          // width: (MediaQuery.of(context).size.width * 0.8) * 0.5,
          // color: Colors.purple,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ((MediaQuery.of(context).size.width * 0.8) * 0.5) * 0.8,
                child: Text(
                  // serviceList[0].name.toString().toUpperCase(),
                  _serviceDetailsController.serviceDetailsData[0].name
                      .toUpperCase()
                      .toString(),
                  // textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Color(0xFF1C4A64),
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width:
                      ((MediaQuery.of(context).size.width * 0.8) * 0.5) * 0.8,
                  child: Text(
                    _serviceDetailsController
                        .serviceDetailsData[0].shortDescription
                        .toString(),
                    textAlign: TextAlign.start,
                    //maxLines: 6,
                    softWrap: true,
                    style:
                        const TextStyle(fontSize: 15, color: Color(0xFF1C4A64)),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  // width: ((MediaQuery.of(context).size.width * 0.8) * 0.5),
                  child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                          "₹${_serviceDetailsController.serviceDiscountedPrice.toString()}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30,
                              color: Color(0xFF1C4A64),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "₹${_serviceDetailsController.servicePrice.toString()}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF1C4A64),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "4.0",
                              style: TextStyle(
                                  color: Color(0xFF1C4A64),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RatingBarIndicator(
                              rating: 4.0,
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
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Panelist:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C4A64)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "City:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C4A64)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Category :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C4A64)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _serviceDetailsController
                            .serviceDetailsData[0].panelistName,
                        style: const TextStyle(color: Color(0xFF1C4A64)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _serviceDetailsController
                            .serviceDetailsData[0].serviceCity
                            .toString(),
                        style: const TextStyle(color: Color(0xFF1C4A64)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _serviceDetailsController
                            .serviceDetailsData[0].servcieCategoryName
                            .toString(),
                        style: const TextStyle(color: Color(0xFF1C4A64)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // changes
              //     ? Column(
              //         children: [
              //           OutlinedButton(
              //               style: OutlinedButton.styleFrom(
              //                   backgroundColor: Colors.white,
              //                   minimumSize: const Size(150, 49),
              //                   side: const BorderSide(
              //                     color: Color.fromARGB(255, 5, 54, 94),
              //                   )),
              //               onPressed: () {},
              //               child: const Text('PER SESSION (1 ON 1)',
              //                   style: TextStyle(
              //                     fontSize: 15,
              //                     color: Color.fromARGB(255, 5, 54, 94),
              //                   ))),
              //           const SizedBox(
              //             height: 20,
              //           ),
              //           SizedBox(
              //             child: ElevatedButton.icon(
              //                 style: ElevatedButton.styleFrom(
              //                   backgroundColor:
              //                       const Color.fromARGB(255, 41, 94, 137),
              //                   minimumSize: const Size(150, 49),
              //                 ),
              //                 onPressed: () {
              //                   print("object");
              //                   // _serviceDetailsController.handleAddtoCart(
              //                   //     context: context,
              //                   //     cartController: cartController);
              //                 },
              //                 icon: const Icon(Icons.local_mall_outlined),
              //                 label: const Text("Add to cart")),
              //           ),
              //         ],
              //       )
              //     :

              Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 41, 94, 137))),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // hint: Text(
                          //   'Select Item',
                          //   style: TextStyle(

                          //     fontSize: 14,
                          //     color: Theme.of(context).hintColor,
                          //   ),
                          // ),

                          offset: const Offset(-20, -10),
                          dropdownWidth: 400,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 41, 94, 137),
                              overflow: TextOverflow.ellipsis),
                          items: _serviceDetailsController
                              .serviceDetailsData[0].session
                              .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e["serviceOptionName"],
                              onTap: () {
                                _serviceDetailsController.servicePrice(
                                    _serviceDetailsController
                                            .serviceDetailsData[0].session[
                                        _serviceDetailsController
                                            .serviceDetailsData[0].session
                                            .indexOf(e)]["servicePrice"]);
                                _serviceDetailsController.serviceDiscountedPrice(
                                    _serviceDetailsController
                                                .serviceDetailsData[0].session[
                                            _serviceDetailsController
                                                .serviceDetailsData[0].session
                                                .indexOf(e)]
                                        ["serviceDiscountedPrice"]);

                                _serviceDetailsController
                                    .configId(e["serviceId"].toString());

                                // print(
                                //     "skkkkkkkkkkkkkkkkkkkkkkk${_serviceDetailsController.serviceDetailsData[0].session.indexOf(e)}");
                              },
                              child: Text(
                                e["serviceOptionName"],
                              ),
                            );
                          }).toList(),
                          dropdownDecoration:
                              const BoxDecoration(color: Colors.white),
                          value: _serviceDetailsController.dropdownValue.value,
                          onChanged: (value) {
                            _serviceDetailsController.dropdownValue(value);
                          },
                          buttonHeight: 40,
                          // buttonWidth: 140,
                          itemHeight: 40,
                          // itemWidth: 140,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.13,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 41, 94, 137),
                          minimumSize: const Size(150, 49),
                        ),
                        onPressed: () {
                          _serviceDetailsController.handleAddtoCart(
                              context: context, cartController: cartController);
                        },
                        icon: const Icon(Icons.local_mall_outlined),
                        label: const Text("Add to cart")),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "Coupon Offer",
                      style: TextStyle(
                          color: Color.fromARGB(255, 41, 94, 137),
                          fontSize: 16),
                    ),
                    TextSpan(
                      text:
                          " Use coupon code APB50  on checkout and get product at discounted",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: " price of Rs 623/-",
                      style: TextStyle(
                          color: Color.fromARGB(255, 41, 94, 137),
                          fontSize: 16),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset("assets/images/fb.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/gmail.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/tw.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/images/in.png")
                ],
              )
            ],
          ),
        ),
      ],
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
                  "HOME  >  Service Details",
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

  Widget serviceExtraDetails({required context}) {
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
                      child: Text("DESCRIPTION"),
                    ),
                  ),

                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("PANELIST"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("REFUND POLICY"),
                    ),
                  ),
                  // Tab(
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Text("Technical Information"),
                  //   ),
                  // ),
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
            height: 250,
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
                  child: Text(_serviceDetailsController
                      .serviceDetailsData[0].description
                      .toString()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(_serviceDetailsController
                      .serviceDetailsData[0].panelistRefundPolicy
                      .toString()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(_serviceDetailsController
                      .serviceDetailsData[0].panelistDescription),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.7,
                //   child: const Text(
                //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a. "),
                // ),
              ],
            ))
      ]),
    );
  }
} //sataeful weiget
