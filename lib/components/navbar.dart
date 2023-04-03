import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/colors.dart';

class Navbar extends StatelessWidget {
  final String currentScreen;
  const Navbar({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! nav 1 start from here
        // currentScreen == "big"
        //     ?
        Container(
          height: 33,
          width: MediaQuery.of(context).size.width,
          color: mainThemeColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentScreen == "big"
                  ? SizedBox(
                      height: 12,
                      width: 536,
                      child: Text(
                        "MYGALF - YOUR TRUSTED WELLNESS MARKETPLACE, YOUR FAVOURITE BRANDS, OUR BEST PRICES !",
                        textAlign: TextAlign.center,
                        // style: GoogleFonts.lato(fontStyle: FontStyle.italic),
                        // style: TextStyle(color: Colors.white, fontFamily: "test"),

                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 11),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 58,
              ),
              SizedBox(
                width: 185,
                height: 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: 31,
                      height: 13,
                      child: Text(
                        "NEWS",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const SizedBox(
                      width: 0,
                      child: VerticalDivider(
                        color: Color(0xFFFFFFFF),
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      height: 13,
                      width: 55,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/about-us");
                        },
                        child: Text(
                          "ABOUT US",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const SizedBox(
                      width: 0,
                      child: VerticalDivider(
                        color: Color(0xFFFFFFFF),
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: 51,
                      height: 13,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/contact-us");
                        },
                        child: Text(
                          "CONTACT",
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 58,
              ),
              SizedBox(
                width: 161,
                height: 20,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed("/download-app");
                      },
                      child: Text(
                        "DOWNLOAD APP",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const SizedBox(
                      width: 0,
                      child: VerticalDivider(
                        color: Color(0xFFFFFFFF),
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed("/contact-us");
                      },
                      child: Text(
                        "CONTACT",
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // : SizedBox(),

        //! nav 2 start from here
        SizedBox(
          // color: Colors.red,
          height: currentScreen == "big"
              ? 80
              : currentScreen == "medium"
                  ? 40
                  : 30,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed("/");
                    },
                    child: Image.asset("assets/images/my_galf_logo.png")),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/products");
                  },
                  child: Text(
                    "GALF SHOP",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: currentScreen == "small"
                              ? 10
                              : currentScreen == "medium"
                                  ? 12
                                  : 15),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/services");
                  },
                  child: Text(
                    "SERVICE",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: currentScreen == "small"
                              ? 10
                              : currentScreen == "medium"
                                  ? 12
                                  : 15),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/events");
                    // Get.to(EventsPage(),
                    //     transition: Transition.rightToLeft,
                    //     duration: Duration(milliseconds: 1000));
                  },
                  child: Text(
                    "EVENTS",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: currentScreen == "small"
                                ? 10
                                : currentScreen == "medium"
                                    ? 12
                                    : 15)),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/corporate-wellness");
                  },
                  child: Text(
                    "CORPORATE WELLNESS",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: currentScreen == "small"
                              ? 10
                              : currentScreen == "medium"
                                  ? 12
                                  : 15),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/blog");
                  },
                  child: Text(
                    "LOUNGE",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: currentScreen == "small"
                              ? 10
                              : currentScreen == "medium"
                                  ? 12
                                  : 15),
                    ),
                  ),
                ),
              ),
              Container(
                height: 33,
                width: 191,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: 'Search items here...',
                    hintStyle:
                        TextStyle(color: Color(0xFF374651), fontSize: 10),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    // suffix: SizedBox(
                    //   width: 10,
                    // ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.search,
                        size: 20,
                        color: Color(0xFF374651),
                      ),
                    ),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 40, minHeight: 20),
                  ),
                ),
              ),
              Row(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        child: Image.asset("assets/icons/price_tag.png")),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: InkWell(
                          child: SizedBox(
                              height: 35,
                              width: 35,
                              // color: Colors.red,
                              child: Stack(
                                children: [
                                  Center(
                                      child:
                                          Image.asset("assets/icons/bag.png")),
                                  const Positioned(
                                      top: 2,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 8,
                                        child: Center(
                                            child: Text(
                                          "0",
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      )),
                                ],
                              )),
                          onTap: () {
                            Get.toNamed("/cart");
                          },
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          child: InkWell(
                        onTap: () {
                          Get.toNamed("/login");
                        },
                        child: Image.asset(
                          "assets/icons/user.png",
                          width: 20,
                          height: 20,
                        ),
                      ))),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
