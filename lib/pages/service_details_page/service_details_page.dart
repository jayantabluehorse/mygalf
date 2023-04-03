import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';

class ServiceDetailsPage extends StatefulWidget {
  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  var selection = "desc";

  bool descSelect = true;
  bool refundPolicy = false;
  bool panelList = false;

  testFun(val) {
    setState(() {
      selection = val;
    });
  }

  final List<Map> myProducts = [
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/img-1.jpg",
    },
    {"title": "Running Watch For Men", "image": "assets/images/img-2.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-3.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-4.jpg"},
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/img-1.jpg",
    },
    {"title": "Running Watch For Men", "image": "assets/images/img-2.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-3.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-4.jpg"},
    {
      "title": "Running Shoes For Men",
      "image": "assets/images/img-1.jpg",
    },
    {"title": "Running Watch For Men", "image": "assets/images/img-2.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-3.jpg"},
    {"title": "Running Watch For Men", "image": "assets/images/img-4.jpg"},
  ];
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
        backgroundColor: Colors.white,
        body: SizedBox(
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: [
                //navbar is component
                Navbar(currentScreen: currentScreen),
                currentRoute(context: context),
                const SizedBox(
                  height: 50,
                ),
                ProductView(context: context),
                const SizedBox(
                  height: 150,
                ),
                ProductExtraDetails(
                  context: context,
                  testFun: testFun,
                  selection: selection,
                ),
                SuggestProductCarouser(
                    context: context,
                    scrollController: scrollController,
                    myProducts: myProducts),

                Footer(context: context)
              ],
            )));
  }

  Widget ProductExtraDetails({
    required context,
    required testFun,
    required selection,
  }) {
    double tempWidth = (MediaQuery.of(context).size.width);
    bool changes = false;
    if (tempWidth <= 950) {
      changes = true;
    }
    const descData =
        " Desc Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a.";
    const rpData =
        " refund Plicy Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a.";
    const plData =
        " panel data Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a.";
    return Column(children: [
      //nav
      Container(
          height: 60,
          color: Color.fromARGB(255, 241, 239, 239),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: changes
                    ? EdgeInsets.only(left: 0)
                    : EdgeInsets.only(left: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          color: descSelect ? Colors.blue : null,
                          height: 60,
                          width: 200,
                          child: Text(
                            "description".toUpperCase(),
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: descSelect
                                        ? Colors.white
                                        : Colors.black)),
                          )),
                      onHover: (value) {
                        print(value);
                      },
                      onTap: () {
                        testFun("desc");
                        setState(() {
                          descSelect = true;
                          refundPolicy = false;
                          panelList = false;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        color: refundPolicy ? Colors.blue : null,
                        height: 60,
                        width: 200,
                        child: Text("Refund Policy".toUpperCase(),
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: refundPolicy
                                        ? Colors.white
                                        : Colors.black))),
                      ),
                      onTap: () {
                        testFun("refund policy");
                        setState(() {
                          descSelect = false;
                          refundPolicy = true;
                          panelList = false;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        color: panelList ? Colors.blue : null,
                        child: Text("panelist".toUpperCase(),
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: panelList
                                        ? Colors.white
                                        : Colors.black))),
                      ),
                      onTap: () {
                        testFun("panel list");
                        setState(() {
                          descSelect = false;
                          refundPolicy = false;
                          panelList = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
      //content

      Container(
        height: 250,
        // width: 1000,
        padding: changes
            ? EdgeInsets.fromLTRB(10, 10, 10, 10)
            : EdgeInsets.fromLTRB(300, 50, 0, 50),
        child: Text(
          selection == "desc"
              ? descData
              : selection == "panel list"
                  ? plData
                  : rpData,
          style: TextStyle(fontSize: 18),
        ),
      )
    ]);
  }
} //sataeful weiget

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
            GestureDetector(
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
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
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
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
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
          Container(
              child: Row(
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
          )),
          const SizedBox(
            height: 4,
          ),
          Container(
              child: Row(
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
                    fontSize: 10),
              ),
              Text(
                "(50% Off)",
                style: TextStyle(
                    color: Color(0xFF28C969),
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              ),
            ],
          )),
        ],
      ),
    ),
  );
}

Widget ProductView({required context}) {
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
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/service.jpg"),
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
                "Therapeutic Yoga Session".toUpperCase(),
                textAlign: TextAlign.start,
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
                width: ((MediaQuery.of(context).size.width * 0.8) * 0.5) * 0.8,
                child: const Text(
                  "Therapeutic Yoga Session is a customised therapy session for a specific health problem or symptom. It is focused on clinical condition of the person & how yoga techniques can help them to reduce the....",
                  textAlign: TextAlign.start,
                  //maxLines: 6,
                  softWrap: true,
                  style: TextStyle(fontSize: 15, color: Color(0xFF1C4A64)),
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
                  child: changes
                      ? Column(
                          children: [
                            const Text(
                              " ₹1250 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF1C4A64),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " ₹2499 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF1C4A64),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Text(
                              " (50% off)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
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
                        )
                      : Row(
                          children: [
                            const Text(
                              " ₹1250 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF1C4A64),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " ₹2499 ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF1C4A64),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Text(
                              " (50% off)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
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
                  children: const [
                    Text(
                      "Dr. Bhavana Diyoro",
                      style: TextStyle(color: Color(0xFF1C4A64)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "MUMBAI",
                      style: TextStyle(color: Color(0xFF1C4A64)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Emotional Wellness",
                      style: TextStyle(color: Color(0xFF1C4A64)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            changes
                ? Column(
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(150, 49),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 5, 54, 94),
                              )),
                          onPressed: () {},
                          child: const Text('PER SESSION (1 ON 1)',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 5, 54, 94),
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 94, 137),
                              minimumSize: const Size(150, 49),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.local_mall_outlined),
                            label: const Text("Add to cart")),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(150, 49),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 5, 54, 94),
                              )),
                          onPressed: () {},
                          child: const Text('PER SESSION (1 ON 1)',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 5, 54, 94),
                              ))),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 94, 137),
                              minimumSize: const Size(150, 49),
                            ),
                            onPressed: () {},
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
                        color: Color.fromARGB(255, 41, 94, 137), fontSize: 16),
                  ),
                  TextSpan(
                    text:
                        " Use coupon code APB50  on checkout and get product at discounted",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: " price of Rs 623/-",
                    style: TextStyle(
                        color: Color.fromARGB(255, 41, 94, 137), fontSize: 16),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  child: Image.asset("assets/images/fb.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Image.asset("assets/images/gmail.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Image.asset("assets/images/tw.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Image.asset("assets/images/in.png"),
                )
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
                "HOME > Service Details",
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
