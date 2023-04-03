import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  final BuildContext context;
  const Footer({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      // height: 700,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 67,
            ),
            SizedBox(
              // color: Colors.grey,
              width: MediaQuery.of(context).size.width * 0.85,
              // height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: 250,
                    width: (MediaQuery.of(context).size.width * 0.85) * 0.25,
                    // color: Colors.red,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("GALF SHOPPING",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )),

                          // const SizedBox(
                          //   width: 166,
                          //   child: Divider(
                          //     color: Colors.white,
                          //     thickness: 3,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            // color: Colors.green,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              children: [
                                SizedBox(
                                  // color: Colors.red,
                                  // width: 155,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Fitness Watches",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            // height: 1,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Sports Shoes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Sports Nutrition",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Fitness Accessories",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Cycling",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Running",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 155,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Triathlon",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Fitness Apparels",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Wellness Kitchens",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Health Foods",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Footwear",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Wellness Books & Artefacts",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // const SizedBox(
                  //   height: 300,
                  //   child: VerticalDivider(
                  //     color: Colors.white,
                  //     thickness: 2,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    // height: 280,
                    // width: 200,
                    // color: Colors.red,
                    width: (MediaQuery.of(context).size.width * 0.80) * 0.20,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "BRANDS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          // const SizedBox(
                          //   width: 100,
                          //   child: Divider(
                          //     color: Colors.white,
                          //     thickness: 3,
                          //   ),
                          // ),

                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "MyGALF",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Garmin",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "COROS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Foodstrong",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "SUUNTO®",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "2XU India",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Vibram",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Brooks",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Saucony India",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Tifosi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Tacx",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Spiritude",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "EOnz",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Fast&Up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Healthtrek",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Healthcare LLP",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "All Brands >>",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // const SizedBox(
                  //   height: 300,
                  //   child: VerticalDivider(
                  //     color: Colors.white,
                  //     thickness: 2,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    // width: 200,
                    // color: Colors.red,
                    width: (MediaQuery.of(context).size.width * 0.85) * 0.20,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "SERVICES",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // const SizedBox(
                          //   width: 100,
                          //   child: Divider(
                          //     color: Colors.white,
                          //     thickness: 3,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Corporate Wellness",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Emotional Wellness",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Mental Wellness",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Physical Wellness",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Nutrition & Diet Plans",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Body Health Check",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // const SizedBox(
                  //   height: 300,
                  //   child: VerticalDivider(
                  //     color: Colors.white,
                  //     thickness: 2,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    // width: 200,
                    // color: Colors.red,
                    width: (MediaQuery.of(context).size.width * 0.85) * 0.25,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "USEFUL LINKS",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // const SizedBox(
                          //   width: 100,
                          //   child: Divider(
                          //     color: Colors.white,
                          //     thickness: 3,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Corporate Wellness",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Privacy Policy",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Term And Condition",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Return And Refund",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "News",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Videos",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Blogs",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  // const SizedBox(
                  //   height: 250,
                  //   child: VerticalDivider(
                  //     color: Colors.white,
                  //     thickness: 2,
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 54,
            ),
            SizedBox(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset("assets/images/Googleplay.png"),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    child: Image.asset("assets/images/appstore.png"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // color: Colors.red,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "© 2022, My Gulf. All rights reserved",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 300,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset("assets/icons/facebook.png"),
                        ),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/icons/instagram.webp")),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/icons/twitter.png")),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/icons/whatsapp.png")),
                      ],
                    ),
                  ),
                  // const Text(
                  //   "Terms and Conditions | Privacy Policy",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ],
              ),
            )
          ]),
    );
  }
}
