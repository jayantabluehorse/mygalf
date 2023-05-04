// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/services_page/service_page_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:my_galf/components/constant.dart';

import '../../components/request_callback/request_callback.dart';
import '../../services/db_helper.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  DBHelper? dbHelper = DBHelper();

  final storage = GetStorage();
  //final xController = Get.put(ServicePageController());
  final servicePageController = Get.find<ServicePageController>();
  // final cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    getPanelistData();
    Future.delayed(Duration.zero, () async {
      servicePageController.fetchProducts();
    });

    //getServiceData();
  }

  var currentValue = -1;
  void addToLocation(index) {
    setState(() {
      currentValue = index;
    });
  }

  String calculateDiscount({required mrp, required discountedPrice}) {
    mrp = double.parse(mrp);
    discountedPrice = double.parse(discountedPrice);

    var discount = mrp - discountedPrice;

    double discountRate = (discount / mrp) * 100;
    return discountRate.toStringAsFixed(2);
  }

  List<PanelistModel> panalistList = [];
  Future<List<PanelistModel>> getPanelistData() async {
    var url = Uri.parse('https://mygalf.tezcommerce.com/api/v1/panelist/list');
    Map data1 = {"storeId": 1};
    var body = json.encode(data1);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
        },
        body: body);

    print("${response.statusCode}");

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        for (Map i in data['details']) {
          PanelistModel panelistModel =
              PanelistModel(name: i['name'], id: i['id'], image: i['image']);
          panalistList.add(panelistModel);
        }
      });
      return panalistList;
    } else {
      return panalistList;
    }
  }

  Future<Map<String, dynamic>> addToCart(int itemId, int quantity) async {
    final url = Uri.parse(
        'https://mygalf.tezcommerce.com/api/v1/cart/productAddToCart');
    final headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "storeId": 1,
      "customerId": storage.read('loggedUserDetails')['id'],
      "type": 'service',
      "id": itemId,
      "itemQuantity": 1
    });
    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    var data = jsonDecode(response.body);
    print("${data['data']}");
    if (response.statusCode == 200) {
      //cartController.getCartItems();

      return {'success': data['success'], 'message': data['message']};
    } else {
      return {'success': false, 'message': 'Failed to add item to cart.'};
    }
  }

  @override
  Widget build(BuildContext context) {
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
          elevation: 0,
          flexibleSpace:
              Navbar(currentScreen: currentScreen, selected: 'service'),
        ),
        body: Stack(
          children: [
            Obx(
              () {
                return SizedBox(
                  width: double.infinity,
                  child: ListView(
                    children: [
                      //navbar is component

                      productHeroCarousel(
                          context: context,
                          scrollController:
                              servicePageController.scrollController,
                          panalistList: panalistList),
                      const SizedBox(
                        height: 20,
                      ),
                      productFilter(context: context),
                      const SizedBox(
                        height: 40,
                      ),
                      servicePageController.isLoading == true
                          ? myLoader
                          : servicePageController.serviceList.isEmpty
                              ? myemptyDataView(context: context)
                              : productList(
                                  addToLocation: addToLocation,
                                  currentValue: currentValue,
                                  dbHelper: dbHelper,
                                  addToCart: addToCart),

                      const SizedBox(
                        height: 50,
                      ),
                      Footer(
                        context: context,
                      )
                    ],
                  ),
                );
              },
            ),
            const RequestCallback()
          ],
        ));
  }

  SizedBox serviceTypes({required String serviceName}) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(4.0),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.grey.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Text(
                  serviceName,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                  weight: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productHeroCarousel(
      {required context, required scrollController, required panalistList}) {
    return Container(
      height: 310,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        // color: Colors.blue,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/services_hero.png",
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Panelist",
            style: TextStyle(
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
                  width: 40,
                  height: 40,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              //List of panelist images
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.72,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: panalistList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/panelist/${panalistList[index].id}");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                    panalistList[index].image.toString()),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              panalistList[index].name.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
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
        ],
      ),
    );
  }

  Widget productList(
      {required addToLocation,
      required currentValue,
      required dbHelper,
      required addToCart}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,

        // color: Colors.amber,
        child: FutureBuilder(
          // future: getServiceData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            } else {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //maxCrossAxisExtent: 200,
                    //childAspectRatio: 1,
                    mainAxisExtent: 457,
                    crossAxisSpacing: 20,
                    crossAxisCount: 4,
                    childAspectRatio: 1.3 / 2.0,
                    mainAxisSpacing: 50,
                  ),
                  itemCount: servicePageController.serviceList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      decoration: currentValue == index
                          ? const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            )
                          : null,
                      alignment: Alignment.center,
                      child: productCard(
                          index: index,
                          addToLocation: addToLocation,
                          currentValue: currentValue,
                          dbHelper: dbHelper,
                          addToCart: addToCart,
                          context: context),
                    );
                  });
            }
          },
        ),
      ),
    );
  }

  // Widget productCardd(
  //     {required index,
  //     required addToLocation,
  //     required currentValue,
  //     required dbHelper,
  //     required addToCart,
  //     required context}) {
  //   return MouseRegion(
  //     cursor: SystemMouseCursors.click,
  //     onEnter: (event) {
  //       addToLocation(index);
  //     },
  //     onExit: (event) {
  //       addToLocation(-1);
  //     },
  //     child: InkWell(
  //       onTap: () {
  //         Get.toNamed(
  //           "/service-details/${servicePageController.serviceList[index].id.toString()}",
  //         );
  //       },
  //       child: Container(
  //         padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
  //         //width: 287,
  //         //  height: 467,
  //         color: Colors.white,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Expanded(
  //               child: Container(
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                     // color: Colors.red,
  //                     image: DecorationImage(
  //                         fit: BoxFit.fill,
  //                         image: NetworkImage(servicePageController
  //                             .serviceList[index].image
  //                             .toString()))),
  //                 // child: Stack(children: const [
  //                 //   Positioned(right: 0, top: 0, child: Icon(Icons.favorite)),
  //                 // ]),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             SizedBox(
  //               height: 20,
  //               child: Text(
  //                 servicePageController.serviceList[index].title
  //                     .toString()
  //                     .toUpperCase(),
  //                 style: GoogleFonts.rubik(
  //                   textStyle: const TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w800,
  //                     color: Color(
  //                       0xFF1C4A64,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             SizedBox(
  //               child: Text(
  //                 servicePageController.serviceList[index].shortDescription
  //                     .toString(),
  //                 maxLines: 2,
  //                 style: const TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF1C4A64)),
  //                 textAlign: TextAlign.start,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 8,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 const Text(
  //                   "2.75",
  //                   style: TextStyle(
  //                       color: Colors.amber,
  //                       fontWeight: FontWeight.w700,
  //                       fontSize: 14),
  //                 ),
  //                 const SizedBox(
  //                   width: 5,
  //                 ),
  //                 RatingBarIndicator(
  //                   rating: 2.75,
  //                   itemBuilder: (context, index) => const Icon(
  //                     Icons.star,
  //                     color: Colors.amber,
  //                   ),
  //                   itemCount: 5,
  //                   itemSize: 14,
  //                   direction: Axis.horizontal,
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 4,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Expanded(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                           "₹${servicePageController.serviceList[index].price.toString()}",
  //                           style: const TextStyle(
  //                               color: Color(0xFF1C4A64),
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 25)),
  //                       const SizedBox(
  //                         width: 5,
  //                       ),
  //                       const Text(
  //                         "₹2,499",
  //                         style: TextStyle(
  //                             decoration: TextDecoration.lineThrough,
  //                             color: Color(0xFF1C4A64),
  //                             fontWeight: FontWeight.w400,
  //                             fontSize: 10),
  //                       ),
  //                       const Text(
  //                         "(50% Off)",
  //                         style: TextStyle(
  //                             color: Color(0xFF28C969),
  //                             fontWeight: FontWeight.w400,
  //                             fontSize: 10),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const Icon(Icons.favorite_border)
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget productFilter({required context}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.78,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Service By",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const Text(
                            "Sports",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "data", child: Text("Cricket")),
                            DropdownMenuItem(
                                value: "data2", child: Text("Football")),
                            DropdownMenuItem(
                                value: "data1", child: Text("Other")),
                          ],
                          onChanged: (value) {}),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const Text(
                            "Online",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "data", child: Text("Online 1")),
                            DropdownMenuItem(
                                value: "data1", child: Text("Online 2")),
                            DropdownMenuItem(
                                value: "data2", child: Text("Online 3")),
                          ],
                          onChanged: (value) {}),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFefeff4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                          icon: const Icon(Icons.expand_more),
                          underline: const Text(""),
                          hint: const Text(
                            "Type",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: "data", child: Text("Type 1")),
                            DropdownMenuItem(
                                value: "data1", child: Text("Type 2")),
                            DropdownMenuItem(
                                value: "data2", child: Text("Type 3")),
                          ],
                          onChanged: (value) {}),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget productCard(
      {required index,
      required addToLocation,
      required currentValue,
      required dbHelper,
      required addToCart,
      required context}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        addToLocation(index);
      },
      onExit: (event) {
        addToLocation(-1);
      },
      child: Container(
        // padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: currentValue == index
              ? [
                  const BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 0.1,
                    color: Color.fromARGB(255, 179, 179, 179),
                  )
                ]
              : [
                  const BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: Colors.white,
                  )
                ],
        ),
        //width: 287,
        //  height: 467,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // productDetailsController
                //     .fetchProducts(productController.productList[index].id);
                Get.toNamed(
                    "/service-details/${servicePageController.serviceList[index].id.toString()}");
              },
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          servicePageController
                              .serviceList[index].thumbnailImage
                              .toString(),
                          // "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
                        ))),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 2, bottom: 1),
                  child: Text(
                    servicePageController.serviceList[index].title.toString(),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1C4A64)),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 250,
                  child: Text(
                    servicePageController.serviceList[index].shortDescription ==
                            null
                        ? "Lorem ipsum dolor amet , consctetur adipiscing elit"
                        : servicePageController
                            .serviceList[index].shortDescription
                            .toString(),
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1C4A64)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FittedBox(
                      child: Text(
                        "4.0",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RatingBarIndicator(
                      rating: 4.0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      itemCount: 5,
                      itemSize: 14,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                          servicePageController
                              .serviceList[index].discountedPrice
                              .toString(),
                          style: const TextStyle(
                              color: Color(0xFF1C4A64),
                              fontWeight: FontWeight.w700,
                              fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      child: Text(
                        servicePageController.serviceList[index].price
                            .toString(),
                        style: const TextStyle(
                            color: Color(0xFF1C4A64),
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    FittedBox(
                      child: Text(
                        "${calculateDiscount(mrp: servicePageController.serviceList[index].price, discountedPrice: servicePageController.serviceList[index].discountedPrice)}% off",
                        style: const TextStyle(
                            color: Color(0xFF28C969),
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Expanded(child: SizedBox()),
                // currenIndex == index
                //     ? Container(
                //         padding: const EdgeInsets.only(),
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Expanded(
                //                 flex: 3,
                //                 child: SizedBox(
                //                   child: ElevatedButton.icon(
                //                       style: ElevatedButton.styleFrom(
                //                           shape: ContinuousRectangleBorder(
                //                               borderRadius:
                //                                   BorderRadius.circular(0.0)),
                //                           backgroundColor:
                //                               const Color(0xFFFF9900),
                //                           //  shape: const RoundedRectangleBorder(),
                //                           minimumSize: const Size(180, 50)

                //                           //onPrimary: Colors.black,
                //                           ),
                //                       onPressed: () {
                //                         servicePageController.handleAddtoCart(
                //                             context: context,
                //                             index: index,
                //                             cartController: _cartController);
                //                       },
                //                       icon: const Icon(
                //                         Icons.lock,
                //                         color: Colors.white,
                //                         size: 13.0,
                //                       ),
                //                       label: const Text(
                //                         "Add to Cart",
                //                         style: TextStyle(
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w500),
                //                       )),
                //                 )),
                //             const Expanded(
                //               child: Icon(Icons.favorite_border,
                //                   size: 24, color: Colors.black),
                //             )
                //           ],
                //         ),
                //       )
                //     : const SizedBox()
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class PanelistModel {
  String name;
  int id;
  String image;
  PanelistModel({required this.name, required this.id, required this.image});
}
