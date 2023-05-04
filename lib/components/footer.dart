import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          Text(
                            "GALF SHOPPING",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          // const SizedBox(
                          //   width: 166,
                          //   child: Divider(
                          //     color: Colors.white,
                          //     thickness: 3,
                          //   ),
                          // ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Fitness Watches",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Sports Shoes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Sports Nutrition",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Fitness Accessories",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Cycling",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Running",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            height: 2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 155,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Triathlon",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Fitness Apparels",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Wellness Kitchens",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Health Foods",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Footwear",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Wellness Books & Artefacts",
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
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
                          Text(
                            "BRANDS",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // const SizedBox(
                          //   width: 100,
                          //   child: Divider(
                          //     color: Colors.white,
                          //     thickness: 3,
                          //   ),
                          // ),

                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "MyGALF",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Garmin",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "COROS",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Foodstrong",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "SUUNTO®",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "2XU India",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Vibram",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Brooks",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
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
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Saucony India",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Tifosi",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Tacx",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Spiritude",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "EOnz",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Fast&Up",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Healthtrek",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Healthcare LLP",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "All Brands >>",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
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
                          Text(
                            "SERVICES",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
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
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Corporate Wellness",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Emotional Wellness",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Mental Wellness",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Physical Wellness",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Nutrition & Diet Plans",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Body Health Check",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
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
                          Text(
                            "USEFUL LINKS",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
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
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.grey))),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Corporate Wellness",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Term And Condition",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Return And Refund",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "News",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Videos",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Blogs",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              height: 2,
                                              color: Colors.grey),
                                        ),
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
                  InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/Googleplay.png"),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  InkWell(
                    onTap: () {},
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
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.facebook.com/mygalf/'))) {
                              throw Exception('Could not launch Instagram');
                            }
                          },
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/icons/facebook.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.instagram.com/mygalf/'))) {
                              throw Exception('Could not launch Instagram');
                            }
                          },
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child:
                                  Image.asset("assets/icons/instagram.webp")),
                        ),
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(
                                Uri.parse('https://twitter.com/mygalf'))) {
                              throw Exception('Could not launch Instagram');
                            }
                            // js.context.callMethod(
                            //     'open', ['https://www.instagram.com/mygalf/']);
                          },
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Image.asset("assets/icons/twitter.png")),
                        ),
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'whatsapp://send/?text=https%3A%2F%2Fmygalf.com%2F'))) {
                              throw Exception('Could not launch Instagram');
                            }
                            // js.context.callMethod(
                            //     'open', ['https://www.instagram.com/mygalf/']);
                          },
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Image.asset("assets/icons/whatsapp.png")),
                        ),
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
