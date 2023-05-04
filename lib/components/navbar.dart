import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/login/login_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../pages/newLogin/login.dart';

class Navbar extends StatefulWidget {
  final String currentScreen;
  final String selected;
  const Navbar(
      {super.key, required this.currentScreen, required this.selected});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final storage = GetStorage();
  final LoginController _loginController = Get.put(LoginController());
  final CartController _cartController = Get.find<CartController>();
  @override
  void initState() {
    super.initState();
    storage.read("loggedUserDetails") != null
        ? Future.delayed(Duration.zero, () async {
            // myFunction();
            _cartController.getCartItems();
          })
        : null;
    // : Future.delayed(Duration.zero, () async {
    //     _cartController
    //         .cartList(_cartController.cartList(storage.read("cart")));
    //   });
    //     : Future.delayed(Duration.zero, () async {
    //         _cartController
    //             .cartList(_cartController.cartList(storage.read("cart")));
    //       });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
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
                  widget.currentScreen == "big"
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
                        // const SizedBox(
                        //   width: 0,
                        //   child: VerticalDivider(
                        //     color: Color(0xFFFFFFFF),
                        //     thickness: 2,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 12,
                        // ),
                        // SizedBox(
                        //   width: 51,
                        //   height: 13,
                        //   child: InkWell(
                        //     onTap: () {
                        //       Get.toNamed("/contact-us");
                        //     },
                        //     child: Text(
                        //       "CONTACT",
                        //       style: GoogleFonts.rubik(
                        //         textStyle: const TextStyle(
                        //           color: Color(0xFFFFFFFF),
                        //           fontWeight: FontWeight.w500,
                        //           fontSize: 11,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
              height: widget.currentScreen == "big"
                  ? 80
                  : widget.currentScreen == "medium"
                      ? 80
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
                        Get.toNamed("/");
                      },
                      child: Text(
                        "Home",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontWeight: widget.selected == 'home'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.currentScreen == "small"
                                  ? 10
                                  : widget.currentScreen == "medium"
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
                        Get.toNamed("/products");
                      },
                      child: Text(
                        "Products",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontWeight: widget.selected == 'products'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.currentScreen == "small"
                                  ? 10
                                  : widget.currentScreen == "medium"
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
                        "Services",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontWeight: widget.selected == 'service'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.currentScreen == "small"
                                  ? 10
                                  : widget.currentScreen == "medium"
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
                        Get.toNamed("/wellnesspage");
                      },
                      child: Text(
                        "Wellness At Work",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontWeight: widget.selected == 'wellnesspage'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.currentScreen == "small"
                                  ? 10
                                  : widget.currentScreen == "medium"
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
                        Get.toNamed("/lounge");
                      },
                      child: Text(
                        "Lounge",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontWeight: widget.selected == 'lounge'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.currentScreen == "small"
                                  ? 10
                                  : widget.currentScreen == "medium"
                                      ? 12
                                      : 15),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33,
                    width: 210,
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
                                          child: Image.asset(
                                              "assets/icons/bag.png")),
                                      Positioned(
                                          top: 2,
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 8,
                                            child: Center(
                                                // ignore: unrelated_type_equality_checks
                                                child: _cartController
                                                            .isLoading ==
                                                        'true'
                                                    ? const SpinKitRing(
                                                        color: Colors.white,
                                                        size: 10.0,
                                                        lineWidth: 2,
                                                      )
                                                    : Text(
                                                        _cartController
                                                            .cartList.length
                                                            .toString(),
                                                        // "0",
                                                        style: const TextStyle(
                                                            fontSize: 10),
                                                      )),
                                          )),
                                    ],
                                  )),
                              onTap: () {
                                storage.read("loggedUserDetails") != null
                                    ? Get.toNamed("/cart")
                                    : showLogin(context);
                              },
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      storage.read("loggedUserDetails") != null
                          ? _profileButton(context)
                          : _loginButton(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  MouseRegion _loginButton() {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            child: InkWell(
          onTap: () {
            showLogin(context);
          },
          child: Image.asset(
            "assets/icons/user.png",
            width: 20,
            height: 20,
          ),
        )));
  }

  SizedBox _profileButton(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width * 0.080,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://e7.pngegg.com/pngimages/348/800/png-clipart-man-wearing-blue-shirt-illustration-computer-icons-avatar-user-login-avatar-blue-child.png"),
          ),
          PopupMenuButton(
            // key: ,

            splashRadius: 15.0,
            enabled: true,
            onSelected: (value) {
              if (value == "profile") {
                Get.toNamed("/profile");
              } else {
                _loginController.getStorage({});
                storage.remove("loggedUserDetails");
                _cartController.cartList([]);
                Future.delayed(Duration.zero, () async {
                  Get.toNamed("/");
                });
              }
            },

            constraints: const BoxConstraints(minWidth: 200),
            position: PopupMenuPosition.under,
            offset: const Offset(100.0, 20.0),
            icon: const Icon(Icons.expand_more),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "profile",
                child: Text('Profile'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: "logout",
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Popup example'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
