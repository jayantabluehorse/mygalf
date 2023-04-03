import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
        body: Container(
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
                ProductExtraDetails(context: context),
                SuggestProductCarouser(
                    context: context,
                    scrollController: scrollController,
                    myProducts: myProducts),
                Footer(context: context)
              ],
            )));
  }
}

Widget ProductExtraDetails({required context}) {
  return Column(children: [
    Container(
      width: MediaQuery.of(context).size.width,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 241, 239, 239)),
      child: UnconstrainedBox(
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              Container(
                width: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Recycled",
                    style: TextStyle(color: Colors.white),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 150,
                // height: 70,
                // color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Product Details",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 150,
                // height: 70,
                // color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Reviews",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 150,
                // height: 70,
                // color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Technical Information",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
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
        padding: EdgeInsets.only(left: 150),
        decoration: const BoxDecoration(
            // color: Color.fromARGB(255, 164, 93, 93)

            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
//mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo, quam at fermentum lacinia, nisi nisi rhoncus leo, quis hendrerit nisi enim ac sapien. Sed malesuada, tellus sit amet volutpat malesuada, libero odio venenatis velit, in commodo nulla lectus vel justo. Fusce et faucibus neque. Sed tempor dolor mauris, nec efficitur arcu bibendum a. "),
            )
          ],
        ))
  ]);
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

Widget ProductView({required context}) {
  return UnconstrainedBox(
    child: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.8,
      height: 900,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width * 0.7) * 0.5,
            // height: 1000,
            // color: Colors.yellow,
            child: Column(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width * 0.7) * 0.5,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      // color: Colors.red,
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/pdp_image1.png"))),
                  height: 400,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          // color: Colors.red,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/pdp_image1.png"))),
                      width: ((MediaQuery.of(context).size.width * 0.7) * 0.5) *
                          0.45,
                      height: 200,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          // color: Colors.red,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/pdp_image1.png"))),
                      width: ((MediaQuery.of(context).size.width * 0.7) * 0.5) *
                          0.45,
                      height: 200,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          // color: Colors.red,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/pdp_image1.png"))),
                      width: ((MediaQuery.of(context).size.width * 0.7) * 0.5) *
                          0.45,
                      height: 200,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          // color: Colors.red,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/pdp_image1.png"))),
                      width: ((MediaQuery.of(context).size.width * 0.7) * 0.5) *
                          0.45,
                      height: 200,
                    ),
                  ],
                )
              ],
            ),
          ),

          //!  details section------------------------------------------
          Container(
            width: (MediaQuery.of(context).size.width * 0.8) * 0.5,
            padding: EdgeInsets.all(5),
            // height: 800,
            // color: Color.fromARGB(255, 143, 140, 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:
                      ((MediaQuery.of(context).size.width * 0.8) * 0.5) * 0.8,
                  child: const Text(
                    "RUNNING SHOES FOR MEN",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF1C4A64),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width:
                        ((MediaQuery.of(context).size.width * 0.8) * 0.5) * 0.8,
                    child: const Text(
                      "Lorem ipsum dolor sit amet,consectetur adipiscing in maximus,mauris a aliquet congue.elit quam ultrices odio.quis fermentum odio augue ac tellus",
                      textAlign: TextAlign.start,
                      maxLines: 5,
                      softWrap: true,
                      style: TextStyle(fontSize: 15, color: Color(0xFF1C4A64)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: ((MediaQuery.of(context).size.width * 0.8) * 0.5),
                    child: Row(
                     //
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: const [
                              Text(
                                "₹1250",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFF1C4A64),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹2499",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF1C4A64),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                "(50% off)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.07,
                        ),
                        Container(
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
                        )),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "PRODUCT DETAILS",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C4A64),
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "SIZE",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C4A64),
                          fontSize: 20),
                    ),
                    SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                    Row(
                      children:  [
                       const Text(
                          "Size Chart",
                          style:  TextStyle(color: Colors.blue),
                        ),
                        SizedBox(
                          child: Image.asset("assets/icons/scle_icon.png",width: 40,height: 15,color: Colors.blue,),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((
                      ele,
                    ) {
                      return Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 40,
                        width: 40,
                        // padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: Center(child: Text("$ele")),
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width:  MediaQuery.of(context).size.width * 0.3,
                  height: 70,
                  
                  decoration: const  BoxDecoration(
                   // border: Border.all(color:Colors.green),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/icons.png"))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 41, 94, 137))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "-",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 41, 94, 137),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 41, 94, 137),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "+",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 41, 94, 137),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 60,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 41, 94, 137),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.local_mall_outlined),
                          label: Text("Add to cart")),
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
  return Container(
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
                  duration: Duration(milliseconds: 500),
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
            Container(
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
                  duration: Duration(milliseconds: 500),
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
          )),
        ],
      ),
    ),
  );
}
