import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_galf/components/product_card.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/product_page/product_controller.dart';

import '../../components/request_callback/request_callback.dart';
import '../../mobile/screens/components/theme.dart';
import 'widgets/blogs/blogs.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currenIndex = -1;

  void updateLocation(index) {
    setState(() {
      currenIndex = index;
    });
  }

  final ScrollController _brandscrollController = ScrollController();

  final ScrollController _userSpeksController = ScrollController();
  final ProductController _productController = Get.put(ProductController());
  final CartController _cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    // _productController.fetchProducts();
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

    return Title(
      title: "MyGALF",
      color: Colors.blue,
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text("$currentWidth"),
          // ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 115,
            elevation: 0,
            flexibleSpace:
                Navbar(currentScreen: currentScreen, selected: 'home'),
          ),
          body: Obx(
            () => Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ListView(
                    children: [
                      //navbar is component
                      // Navbar(currentScreen: currentScreen),
                      //todo -  hero carousel shop now button pending
                      // SizedBox(
                      //     height: 200,
                      //     width: 200,
                      //     child: Image.asset("assets/images/loader_big.gif")),
                      heroCarousel(
                        context: context,
                        currentScreen: currentScreen,
                      ),
                      const SizedBox(
                        height: 51,
                      ),
                      //Shop by brads
                      brandCarousel(
                          context: context,
                          scrollController: _brandscrollController),
                      const SizedBox(
                        height: 58,
                      ),
                      corporateWellnessProducts(context, currentScreen),

                      progressArea(context),
                      const SizedBox(
                        height: 28,
                      ),
                      corporateArea(context),
                      const SizedBox(
                        height: 30,
                      ),
                      corporateWellness(context),
                      const SizedBox(
                        height: 51,
                      ),
                      topPicks(
                          context: context,
                          updateLocation: updateLocation,
                          currentIndex: currenIndex),
                      const SizedBox(
                        height: 10,
                      ),
                      fitnessFriday(context),
                      const SizedBox(
                        height: 69,
                      ),
                      myGalfSpeekers(
                          context: context,
                          scrollController: _userSpeksController),
                      const SizedBox(
                        height: 100,
                      ),
                      advantageMygalf(context),
                      const SizedBox(
                        height: 64,
                      ),
                      Blogs(),
                      const SizedBox(
                        height: 64,
                      ),
                      newsCoverage(context),
                      const SizedBox(
                        height: 0,
                      ),
                      Footer(context: context),
                      // const SizedBox(
                      //   height: 5000,
                      // ),
                    ],
                  ),
                ),
                const RequestCallback()
              ],
            ),
          )),
    );
  }

  Widget heroCarousel({required context, required currentScreen}) {
    return SizedBox(
      height: 563,
      // color: Colors.red,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: currentScreen == "xsmall"
                    ? 200
                    : currentScreen == "small"
                        ? 300
                        : currentScreen == "medium"
                            ? 400.0
                            : 500,
                scrollDirection: Axis.vertical,
                viewportFraction: 1.0,
                enableInfiniteScroll: false),
            items: [
              1,
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/hero.jpg"))),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            top: 100,
            left: 155,
            child: SizedBox(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.3,
              // height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Corporate Wellness Made Fun & Easy",
                    // style: Theme.of(context).textTheme.headline1,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A3E4E),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Text(
                    "Choose from hundreds of workouts, healthy recipes, relaxing meditations, and expert articles, for a whole body and mind approach to feeling great",
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1C3844))),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  SizedBox(
                    width: 170,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F7FDC),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Get.toNamed('/products');
                      },
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            // fontWeight: FontWeight,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topPicks(
      {required context, required updateLocation, required currentIndex}) {
    return SizedBox(
      // color: Colors.red,
      // height: 20,00

      child: Column(children: [
        Text("MyGALF Top Picks",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A3E4E)),
            )),
        const SizedBox(
          height: 43,
        ),
        Text(
          "Our experts test and rate hundreds of products each year. We’re updating our roundups all the time, so you always know\n what’s best to buy. See the latest top picks in our most popular products",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Color(0xFF1A3E4E))),
        ),
        const SizedBox(
          height: 43,
        ),
        SizedBox(
          // color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.8,

          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 40,
                  crossAxisCount: 4,
                  childAspectRatio: 1.2 / 2.0,
                  mainAxisExtent: 457,
                  mainAxisSpacing: 50),
              itemCount: _productController.productList.length > 8
                  ? 8
                  : _productController.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: ProductCard(
                  cartController: _cartController,
                  currenIndex: currentIndex,
                  index: index,
                  myProducts: _productController.productList,
                  productController: _productController,
                  updateLocation: updateLocation,
                ));
              }),
        )
      ]),
    );
  }
}

Widget corporateWellnessProducts(context, currentScreen) {
  return Container(
    height: currentScreen == "big"
        ? 613
        // ignore: unrelated_type_equality_checks
        : currentScreen == "medium"
            ? 400
            : 200,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/corporateWellness.jpg"),
          fit: BoxFit.cover),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //left container
        Container(
          padding: const EdgeInsets.all(80),
          alignment: Alignment.center,
          height: 468,
          width: 650,
          // color: Colors.red,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Corporate Wellness \n Made Fun & Easy",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 48),
                    color: const Color(0xFF1A3E4E),
                  ),
                ),
                Container(
                    width: 468,
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "Recipes to Refuel and Recover after Strength Workouts",
                      style: GoogleFonts.rubik(
                          color: const Color(0xFF1A3E4E),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )),
                InkWell(
                  child: Container(
                    width: 139,
                    height: 48,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 127, 220),
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Text(
                      "Shop Now",
                      style: GoogleFonts.rubik(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/products');
                  },
                )
              ]),
        ),
        //right container
        Container(
          alignment: Alignment.center,
          height: 581,
          width: 350,
          // color: Color.fromARGB(255, 54, 244, 79),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top contaioner
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 250,
                  // color: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Ultimate Training Watch - Water Proof",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                            color: Colors.white),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam facilisis ac tellus vel varius. Vestibulum ante.",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                //bottom container
                SizedBox(
                  height: 250,
                  // color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Work Hard, Run Fast - Flexible & Comfortable",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                            color: Colors.white),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam facilisis ac tellus vel varius. Vestibulum ante.",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ]),
        )
      ],
    ),
  );
}

//! multy part widgets created bellow
Widget newsCoverage(context) {
  return Container(
    color: const Color.fromARGB(255, 242, 242, 242),
    // color: Colors.red,
    // height: 957,
    // width:1080,
    width: MediaQuery.of(context).size.width * 0.9,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          "News Coverage",
          style: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              color: Color(0xFF1A3E4E),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Learn about the latest trends and topics on Corporate\nWellness with the Galf Blog.",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              color: const Color(0xFF374651),
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
          // textAlign: Alignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 1080,
          // color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.green,
                height: 690,
                width: 329,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white,
                      ),
                      height: 342,
                      width: 329,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 329,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/news_coverage1.png"),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A3E4E),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white,
                      ),
                      height: 342,
                      width: 329,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 329,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/news_coverage2.png"),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit2.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A3E4E),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 725,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      width: 725,
                      height: 680,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 409,
                            width: 728,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(20),
                                  topEnd: Radius.circular(20)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/news_coverage3.jpg"),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Get Fit Now",
                                    style: GoogleFonts.rubik(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 28,
                                        color: Color(0xFF1A3E4E),
                                      ),
                                    )),
                                const SizedBox(height: 10),
                                Text(
                                    "Feel energized and empowerd with our state-of-the-art equipment and inspring classes. transform your bosy and mind with our gym and fitness programs.",
                                    style: GoogleFonts.rubik(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Color(0xFF1A3E4E),
                                      ),
                                    )),
                                const SizedBox(height: 20),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet blandit eros. Proin cursus tincidunt nibh, id blandit elit. Vivamus pellentesque ornare sagittis. Donec in tincidunt neque. Etiam ultrices ex vitae efficitur suscipit.",
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF1A3E4E),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Navin Triven, ",
                                      style: GoogleFonts.rubik(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25,
                                          color: Color(0xFF1A3E4E),
                                        ),
                                      ),
                                    ),
                                    Text("07/02/2023",
                                        style: GoogleFonts.rubik(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Color(0xFF1A3E4E),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              width: 218,
              height: 64,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F7FDC)),
                  onPressed: () {},
                  child: Text(
                    "View More",
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700)),
                  ))),
        )
      ],
    ),
  );
} // news coverage

Widget myGalfSpeekers({required context, required scrollController}) {
  return SizedBox(
    // color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("MyGALF User Speaks",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Color(0xFF1A3E4E),
              ),
            )),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 479,
          // color: Colors.yellow,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                // width: 433,
                // height: 262,
                // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CONNECT WITH\nOTHER MEMBERS",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 45,
                            color: Color(0xFF1A3E4E),
                          ),
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Proin sit amet tincidunt justo, at semper eros.",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Color(0xFF000000),
                          ),
                        )),
                    const SizedBox(
                      height: 34,
                    ),
                    SizedBox(
                      height: 56,
                      width: 191,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F7FDC),
                        ),
                        onPressed: () {},
                        child: Text("View More",
                            style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                flex: 3,
                // color: const Color.fromARGB(255, 54, 70, 244),
                // height: 479,
                // width: 712,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        // color: Colors.green,
                        width: 712,
                        height: 350,
                        // child: Row(children: [

                        //   MyGalfSpeksCard(),
                        // ]),

                        // child: ListView.builder(

                        //   itemCount: 5,
                        //   scrollDirection: Axis.horizontal,
                        //   itemBuilder: (context, index) {
                        //     return MyGalfSpeksCard();
                        //   },
                        // )

                        child: ListView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              myGalfSpeksCard(
                                image: "assets/images/Speaker1.png",
                                text:
                                    "MyGALF.com is the best site for all your wellness products. From my Garmin Forerunner to my Foodstrong Nutrition, they have it all!! Even my trainees prefer to source their fitness needs from them!",
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                  image: "assets/images/Speaker2.png",
                                  text:
                                      "Relied on MyGALF.com for purchasing my Garmin! Dlighted wiht the ease of transactionand quick delivery. Genuine puoducts frim trusted brands ensures my loyalty to them-Healthtrek, Foodstrong, Fast&Up are some of the brands I've already purchased!"),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                  image: "assets/images/Speaker3.png",
                                  text:
                                      "Gifting myself the Garmon Venu Sq Music from MyGALF was a great decision! Genuine products, amazing price points, quick delivery!! Thir wide chice of wellness products and trusted brands, make them my first choice for any fitness purchase!"),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                  image: "assets/images/Speaker4.png",
                                  text:
                                      "Surprising my wife with a Garmon Instinct Seafoam for her first HM from the MyGALF.com wellness website was a wise decision. Wide choice of trusted brands, ease of transaction and all in all a great shopping experience!"),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                  image: "assets/images/Speaker5.png",
                                  text:
                                      "My decision to surprise my husband with a Garmon Instinct from MyGALF.com was definitely a brilliant idea! Great pricing, prompt delivery and expery guidance made the decision so easy for me!"),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                  image: "assets/images/Speaker6.png",
                                  text:
                                      "Decided on MyGALF.com for purchasing a Garmon to be gifted. The multiple payment options, super quick 36- hour delivery, and great offers definitely made it a great overall experience. Highly recommend them for your wellness shopping!"),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                image: "assets/images/Speaker7.png",
                                text:
                                    "It was a wonderful experience to buy the Kipchoge Edition COROS Pace 2 from MyGALF. They managed to arrange this limited edition watch for me in India, that too with a great offer! Absolutely live my COROS, and amazed with the superlative experience with this multi-brand fitness website!",
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              myGalfSpeksCard(
                                image: "assets/images/Speaker8.png",
                                text:
                                    "Loved my Garmin Venu Sq from MyGALF! Their apt guidance and prompt service has been impressive! Check out their site for great prices on all your favourite brands. It's my go-to wellness market place for my hydrantlon and nutrition needs too!",
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                            ])),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      // color: Colors.amber,
                      height: 35,
                      width: 126,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                width: 35,
                                height: 35,
                                color: const Color(0xFF1C3844),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 56,
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
                                width: 35,
                                height: 35,
                                color: const Color(0xFF1C3844),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget myGalfSpeksCard({required String image, required String text}) {
  return SizedBox(
    width: 225,
    height: 280,
    // color: Color.fromARGB(255, 244, 15, 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 193,
          width: 225,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(image),
            ),
          ),
        ),
        // Container(
        //   height: 30,
        //   decoration: BoxDecoration(
        //   color: Colors.red,

        //   image:DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/cotation.png"))

        //   ),
        // ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 140,
          width: 225,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1C3844),
                  ),
                ),
                softWrap: true,
                maxLines: 5,

                // overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "Rohith Raj",
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                  color: Color(0xFF374651),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                )),
              ),
              Text("Director@ Stonepeek.pvt",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      color: Color(0xFF374651),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 20,
                width: 62,
                child: Row(
                  children: [
                    Container(
                      width: 23,
                      height: 23,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/linkedin.png"))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 23,
                      height: 23,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/youtube.png"))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget advantageMygalf(context) {
  return Container(
    height: 359,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/Rectangle_74.png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ADVANTAGE MYGALF",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            )),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 138,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/icons/Group_260.png",
                width: 137,
                height: 179,
              ),
              SizedBox(
                width: 137,
                height: 179,
                child: Image.asset("assets/icons/Group_261.png"),
              ),
              Image.asset(
                "assets/icons/Group_262.png",
                width: 137,
                height: 179,
              ),
              Image.asset(
                "assets/icons/Group_263.png",
                width: 137,
                height: 179,
              ),
              Image.asset(
                "assets/icons/Group_264.png",
                width: 137,
                height: 179,
              ),
              Image.asset(
                "assets/icons/Group_265.png",
                width: 137,
                height: 179,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget fitnessFriday(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 483,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/Group_278.png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("09 Dec 2022, 07:00 AM",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                const SizedBox(
                  height: 13,
                ),
                Text("AFLI EXCLUSIVE FITNESS FRIDAY",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    )),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "Strengthening, Low Intensity Ergonomic Stretching &\nFlexibility Session By Girish Bindra",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 191,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000000),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 19)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 191,
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 52,
            ),
            const SizedBox(
              height: 250,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            const SizedBox(
              width: 52,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("09 Dec 2022, 07:00 AM",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                const SizedBox(
                  height: 13,
                ),
                Text("AFLI EXCLUSIVE FITNESS FRIDAY",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    )),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "Strengthening, Low Intensity Ergonomic Stretching &\nFlexibility Session By Girish Bindra",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 191,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000000),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 19)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 191,
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: 191,
            height: 56,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F7FDC)),
                onPressed: () {
                  Get.toNamed('/services');
                },
                child: Text(
                  "View More",
                  style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                          color: Color(0xFFFFFFFF))),
                )))
      ],
    ),
  );
}

// Widget Footer(context) {
//   return
// }

// Widget TopPickCard(
//     {required context,
//     required index,
//     required updateLocation,
//     required currentIndex}) {
//   final List<Map> myProducts = [
//     {
//       "title": "Running Shoes For Men",
//       "image": "assets/images/running_shoes_men.png",
//     },
//     {
//       "title": "Running Watch For Men",
//       "image": "assets/images/running_watch_men.png"
//     },
//     {"title": "Running Watch For Men", "image": "assets/images/fast_up.png"},
//     {"title": "Running Watch For Men", "image": "assets/images/hand.png"},
//     {
//       "title": "Running Shoes For Men",
//       "image": "assets/images/running_shoes_men.png"
//     },
//     {
//       "title": "Running Watch For Men",
//       "image": "assets/images/running_watch_men.png"
//     },
//     {"title": "Running Watch For Men", "image": "assets/images/fast_up.png"},
//     {"title": "Running Watch For Men", "image": "assets/images/hand.png"},
//     {
//       "title": "Running Shoes For Men",
//       "image": "assets/images/running_shoes_men.png"
//     },
//     {
//       "title": "Running Watch For Men",
//       "image": "assets/images/running_watch_men.png"
//     },
//     {"title": "Running Watch For Men", "image": "assets/images/fast_up.png"},
//     {"title": "Running Watch For Men", "image": "assets/images/hand.png"}
//   ];
//   return MouseRegion(
//     onEnter: (event) {
//       updateLocation(index);
//     },
//     onExit: (event) {
//       updateLocation(-1);
//     },
//     cursor: SystemMouseCursors.click,
//     child: GestureDetector(
//       // color: Colors.white,

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 287,
//             width: 267,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Image.asset(myProducts[index]["image"]),
//           ),
//           const SizedBox(
//             height: 14,
//           ),
//           SizedBox(
//               height: 156,
//               width: 267,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 66,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(myProducts[index]["title"],
//                             style: GoogleFonts.rubik(
//                               textStyle: const TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w700,
//                                   color: Color(0xFF1C3844)),
//                             )),
//                         const SizedBox(
//                           height: 12,
//                         ),
//                         Text(
//                             "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit.",
//                             style: GoogleFonts.rubik(
//                               textStyle: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xFF1C3844)),
//                             )),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   SizedBox(
//                     height: 28,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             const Text(
//                               "4.0",
//                               style: TextStyle(
//                                   color: Colors.amber,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 17),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             RatingBarIndicator(
//                               rating: 4.0,
//                               itemBuilder: (context, index) => const Icon(
//                                 Icons.star,
//                                 color: Colors.amber,
//                               ),
//                               itemCount: 5,
//                               itemSize: 17,
//                               direction: Axis.horizontal,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 33,
//                         ),
//                         const Text(
//                           "₹1599",
//                           style: TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 12,
//                               color: Color(0xFF1C3844)),
//                         ),
//                         const SizedBox(
//                           width: 7,
//                         ),
//                         const Text(
//                           "₹1199",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 20,
//                               color: Color(0xFF1C3844)),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   SizedBox(
//                     height: 54,
//                     width: 267,
//                     // color: Colors.red,
//                     child: Visibility(
//                       visible: index == currentIndex ? true : false,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF2F7FDC),
//                             shape: RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.circular(10), // <-- Radius
//                             ),
//                           ),
//                           onPressed: () {
//                             Get.toNamed("/pdp");
//                           },
//                           child: Text("Shop Now",
//                               style: GoogleFonts.rubik(
//                                 textStyle: const TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w700),
//                               ))),
//                     ),
//                   )
//                 ],
//               )),
//         ],
//       ),
//     ),
//   );
// }
Widget topPickCard(
    {required context,
    required index,
    required updateLocation,
    required currentIndex}) {
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
  return MouseRegion(
    onEnter: (event) {
      //print(event);
      updateLocation(index);
    },
    onExit: (event) {
      updateLocation(-1);
    },
    child: Container(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: currentIndex == index
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
                  color: Color.fromARGB(255, 179, 179, 179),
                )
              ],
      ),
      //width: 287,
      //  height: 467,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed("/products/$index");
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  myProducts[index]['image'],
                ))),
              ),
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
          ),
          currentIndex == index
              ? Container(
                  padding: const EdgeInsets.only(top: 3, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: const Color(0xFFFF9900),
                                  //  shape: const RoundedRectangleBorder(),
                                  minimumSize: const Size(180, 50)

                                  //onPrimary: Colors.black,
                                  ),
                              onPressed: () {
                                Get.snackbar("Added", "Item Added Successfully",
                                    backgroundColor: Colors.green);
                              },
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 13.0,
                              ),
                              label: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ))),
                      const Expanded(
                        child: Icon(Icons.favorite_border,
                            size: 24, color: Colors.black),
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  );
}

Widget corporateWellness(context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Rectangle.png"),
            fit: BoxFit.fill)),
    width: MediaQuery.of(context).size.width,
    height: 668,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Corporate ',
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        color: Color(0xFFFFFFFF),
                        fontStyle: FontStyle.italic)),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Wellness\n',
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 48,
                            color: Color(0xFF2F7FDC),
                            fontStyle: FontStyle.italic)),
                  ),
                  TextSpan(
                    text: 'Made Fun & Easy!',
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 48,
                            color: Color(0xFFFFFFFF),
                            fontStyle: FontStyle.italic)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Text(
                " Manage all Employee Wellness activities with one Subscription \n Under one  Platform",
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w400))),
            const SizedBox(
              height: 17,
            ),
            Text(
                " \u2022 Manage all Employee Wellness in one Platform\n \u2022 Wellness Surveys, Strategies and  Analytics\n \u2022 Leadership Dashboard\n \u2022 Bonus Rewards for Employees\n \u2022 Access to Premium Events",
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 2))),
            const SizedBox(
              height: 27,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  width: 211,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F7FDC),
                      // shape: StadiumBorder()
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Schdule a free demo",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  height: 48,
                  width: 180,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(width: 2, color: Color(0xFF2F7FDC)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Start free trial",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFF2F7FDC)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Image.asset("assets/images/my-gluf-home3.png")
      ],
    ),
  );
}

Widget corporateArea(context) {
  return SizedBox(
    height: 550,
    child: Column(
      children: [
        Text("Our Corporates",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Color(0xFF1A3E4E)),
            )),
        const SizedBox(
          height: 35,
        ),
        Text(
          "We have happily transformed employee health in companies from more \n than 26 countries",
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF1C3844),
                  fontWeight: FontWeight.w400)),
        ),
        const SizedBox(
          height: 35,
        ),
        Container(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.8,
          height: 295,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/Group_198.png"))),
        ),
        const SizedBox(
          height: 35,
        ),
        SizedBox(
            width: 218,
            height: 64,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F7FDC)),
                onPressed: () {},
                child: Text(
                  "View More",
                  style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.w700)),
                )))
      ],
    ),
  );
}

Widget progressArea(context) {
  return SizedBox(
    // height: 700,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      children: [
        progressCard(context),
        Positioned(
            top: 163,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 214,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/Vector.png",
                            width: 38,
                            height: 61,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "28,58,000",
                            style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    color: Color(0xFF1A3E4E),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Steps",
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1A3E4E),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/Vector_2.png",
                            width: 38,
                            height: 61,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "18,15,800",
                            style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    color: Color(0xFF1A3E4E),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Calories",
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1A3E4E),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/distance.png",
                            width: 38,
                            height: 61,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "2177.8km",
                            style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    color: Color(0xFF1A3E4E),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Distence",
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1A3E4E),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/point.png",
                            width: 38,
                            height: 61,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "12,500",
                            style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    color: Color(0xFF1A3E4E),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Points",
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1A3E4E),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

Widget progressCard(context) {
  return Column(
    children: [
      Container(
        height: 332,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/blue_background.png"))),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Progress & Earn Money",
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 35,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Revolutionizing employee wellness journeys around the globe.\nKickstart yours today & get and earn money",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
      Container(
        height: 516,
        color: const Color(0xFF15242D),
        child: Column(
          children: [
            const SizedBox(
              height: 96,
            ),
            Text(
              "Join MyGALF Club",
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 35,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Join MyGalf Club, your one-stop wellness partner",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white))),
                  height: 200,
                  width: 200,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/party.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Priority Access to \n premium events",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white))),
                  height: 200,
                  width: 200,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/christmas-card.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Priority Access to \n premium events",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white))),
                  height: 200,
                  width: 200,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/coin.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Priority Access to \n premium events",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.white))),
                  height: 200,
                  width: 200,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/purchase_1.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Priority Access to \n premium events",
                        style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget brandCard({required context, required index, required data}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: InkWell(
      onTap: () {
        Get.toNamed("/products");
      },
      child: Container(
        height: 343,
        width: MediaQuery.of(context).size.width / 5.9,
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        child: Column(
          children: [
            Image.asset(
              data[index]["logo"],
              width: 90,
              height: 28,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage(data[index]["mainimage"]))
                  // border: Border(
                  //   left: BorderSide(
                  //     color: Colors.black,
                  //   ),
                  //   right: BorderSide(color: Colors.black),
                  //   bottom: BorderSide(color: Colors.black),
                  // ),
                  ),
              height: 250,
              width: 200,

              // child: Column(children: [
              //   Image.asset(
              //     "assets/images/tacx_body.png",
              //     width: 192,
              //     height: 192,
              //   ),
              // SizedBox(
              //   width: 125,
              //   height: 38,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: const Color(0xFF2F7FDC)),
              //     child: Text(
              //       "Shop More",
              //       style: GoogleFonts.rubik(
              //           textStyle: const TextStyle(
              //               fontSize: 13, fontWeight: FontWeight.w700)),
              //     ),
              //     onPressed: () {},
              //   ),
              // )
              // ]),
            )
          ],
        ),
      ),
    ),
  );
}

Widget brandCarousel({required context, required scrollController}) {
  const List data = [
    {
      "mainimage": "assets/images/tacx_body.png",
      "logo": "assets/images/tacx.png"
    },
    {
      "mainimage": "assets/images/whey_fst.png",
      "logo": "assets/images/fast_and_up.png"
    },
    {
      "mainimage": "assets/images/shoe.png",
      "logo": "assets/images/saucony.png"
    },
    {
      "mainimage": "assets/images/tacx_body.png",
      "logo": "assets/images/tacx.png"
    },
    {
      "mainimage": "assets/images/watchs.png",
      "logo": "assets/images/coros.png"
    },
  ];
  return Column(
    children: [
      Text("Shop By Brands",
          style: GoogleFonts.rubik(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Color(0xFF1A3E4E)),
          )),
      const SizedBox(
        height: 27,
      ),
      Text(
        "We have happily served our client with our brand from more \n than 26 countries",
        textAlign: TextAlign.center,
        style: GoogleFonts.rubik(
            textStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF1A3E4E),
                fontWeight: FontWeight.w400)),
      ),
      const SizedBox(
        height: 27,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue,
            width: 30,
          ),
          InkWell(
            onTap: () {
              scrollController.animateTo(
                scrollController.offset - 300.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: const SizedBox(
              width: 40,
              height: 40,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 343,
            width: MediaQuery.of(context).size.width / 1.4,
            child: ListView.builder(
              itemCount: data.length,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return brandCard(context: context, index: index, data: data);
              },
            ),
          ),
          Container(
            color: Colors.blue,
            width: 10,
          ),
          InkWell(
            onTap: () {
              scrollController.animateTo(
                scrollController.offset + 300.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: const SizedBox(
              width: 40,
              height: 40,
              // decoration:
              // BoxDecoration(border: Border.all(color: Colors.black)),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: 218,
        height: 64,
        child: ElevatedButton(
            onPressed: () {
              Get.toNamed("/products");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F7FDC)),
            child: Text("View More",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w700),
                ))),
      )
    ],
  );
}
