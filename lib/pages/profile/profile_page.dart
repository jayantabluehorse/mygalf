import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/login/login_controller.dart';
import './profile_controller.dart';
import 'widgets/wish_list/wish_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileController _profileController = Get.find<ProfileController>();
  final LoginController _loginController = Get.find<LoginController>();
  final CartController _cartController = Get.find<CartController>();
  var storage = GetStorage();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _profileController.getUserDetails(
          userId: storage.read("loggedUserDetails")["id"]);
      _profileController.getOrderDetails(
          userId: storage.read("loggedUserDetails")["id"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("**************-------------------${_profileController.userDetails}");
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 600
            ? "small"
            : currentWidth >= 600 && currentWidth <= 1200
                ? "medium"
                : "big";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 115,
          flexibleSpace:
              Navbar(currentScreen: currentScreen, selected: 'profile'),
        ),
        body: Obx(
          () => _profileController.isLoading == true
              ? myLoader
              : Container(
                  color: const Color(0xFFececec),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _pageTitle(currentWidth: currentWidth),
                        const SizedBox(
                          height: 40,
                        ),
                        _mainSection(currentWidth),
                        const SizedBox(
                          height: 300,
                        ),
                      ],
                    ),
                  ),
                ),
        )

        //  ListView(
        //   children: [
        //     _accountTop(currentWidth: currentWidth),
        //     // const Divider(
        //     //   color: Colors.black,
        //     // ),
        //     // Background(currentWidth)
        //   ],
        // ),
        );
  }

  SizedBox _mainSection(double currentWidth) {
    return SizedBox(
      // color: Colors.red,
      width: currentWidth * 0.8,
      // height: 650,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _leftSection(currentWidth),
          _rightSection(currentWidth),
        ],
      ),
    );
  }

  Container _rightSection(double currentWidth) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: (currentWidth * 0.8) * 0.7,
      child: _profileController.selectedButton == "Account Info"
          ? _profileDetails(currentWidth)
          : _profileController.selectedButton == "Change Password"
              ? _changePassword(currentWidth)
              : _profileController.selectedButton == "My Orders"
                  ? _myOrders(currentWidth: (currentWidth * 0.8) * 0.7)
                  : _profileController.selectedButton == "Wishlist"
                      ? WishList()
                      : SizedBox(
                          height: 600,
                          child: Center(
                            child: Text(
                              "${_profileController.selectedButton}",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
    );
  }

  SizedBox _myOrders({required double currentWidth}) {
    return SizedBox(
      // color: Colors.red,
      width: currentWidth,

      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border(
                    bottom: BorderSide(color: Colors.black.withOpacity(0.2)))),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Orders",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: currentWidth * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Container(
                      //   height: 30,
                      //   decoration: BoxDecoration(
                      //       // color: const Color(0xFF205e81),
                      //       borderRadius: BorderRadius.circular(30)),
                      //   width: currentWidth * 0.2,
                      //   child: const Center(
                      //     child: FittedBox(
                      //       child: Text(
                      //         "Invoice",
                      //         style:
                      //             TextStyle(color: Colors.black, fontSize: 20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xFF205e81),
                              borderRadius: BorderRadius.circular(5)),
                          width: currentWidth * 0.2,
                          child: const Center(
                            child: FittedBox(
                              child: Text(
                                "Track Order",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
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
          SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: _profileController.myOrdersList.length,
                itemBuilder: (context, index) {
                  return _orderCard(
                      currentWidth: currentWidth,
                      data: _profileController.myOrdersList[index]);
                },
              ))
        ],
      ),
    );
  }

  Container _orderCard({required double currentWidth, required data}) {
    return Container(
      width: currentWidth,
      // color: const Color.fromARGB(255, 148, 69, 69),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2)))),
      height: 130,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(data["thumbnailImage"]),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 20),
            // color: Colors.blue,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Order Id :",
                          style: const TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: data["orderNo"],
                            style: const TextStyle(
                                color: Color(
                                  0xFF205e81,
                                ),
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: "   ${data["createdAt"]}",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)))
                            ])
                      ])),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data["name"],
                    // "FORCLAZ",
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // data["description"] != null
                  //     ? Text(
                  //         data["description"],
                  //         softWrap: true,
                  //         maxLines: 1,
                  //       )
                  //     : const Text(""),
                  // const SizedBox(
                  //   height: 3,
                  // ),
                  Row(
                    children: [
                      Text(
                        "₹${data["price"]}",
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "₹${data["originalPrice"]}",
                        style: const TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Qty :${data["qty"]}"),
                ]),
          )),

          Row(
            children: [
              const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                data["orderStatus"].toString() == "Processing"
                    ? "IN PROCESS"
                    : "",
                style: const TextStyle(
                  color: Color(
                    0xFF205e81,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: currentWidth * 0.08,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          )
          // SizedBox(
          //   // color: const Color.fromARGB(255, 33, 243, 152),
          //   width: currentWidth * 0.08,
          //   child:
          //       Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //     data["orderStatus"].toString() == "Processing"
          //         ? const Text(
          //             "Cancel",
          //             style: TextStyle(color: Colors.red),
          //           )
          //         : Text(
          //             data["orderStatus"],
          //             style: const TextStyle(color: Colors.green),
          //           ),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //   ]),
          // )
        ],
      ),
    );
  }

  SizedBox _changePassword(double currentWidth) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border(
                    bottom: BorderSide(color: Colors.black.withOpacity(0.2)))),
            height: 65,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // _profileController.isPasswordVerified == true
                //     ? InkWell(
                //         onTap: () {
                //           _profileController.isPasswordVerified(false);
                //         },
                //         child: const Icon(Icons.arrow_back))
                //     : const SizedBox(),
                // _profileController.isPasswordVerified == true
                //     ? const SizedBox(
                //         width: 20,
                //       )
                //     : const SizedBox(
                //         width: 0,
                //       ),
                Text(
                  "Change Pasword",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            width: (currentWidth * 0.8) * 0.7,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            // decoration: const BoxDecoration(color: Colors.red),
            child: _savePassword(currentWidth),

            // const SizedBox(
            //   height: 40,
          ),
        ],
      ),
    );
  }

  Container _savePassword(double currentWidth) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: (currentWidth * 0.8) * 0.7,
            child: TextField(
              controller: _profileController.previousPasswordController,
              decoration: InputDecoration(
                  hintText: "Previous Password",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: (currentWidth * 0.8) * 0.7,
            child: TextField(
              controller: _profileController.newPasswordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: (currentWidth * 0.8) * 0.7,
            child: TextField(
              controller: _profileController.confirmPasswordController,
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              width: (currentWidth * 0.8) * 0.15,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF205e81),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    _profileController.changePassword(
                        context: context,
                        userId: storage.read("loggedUserDetails")["id"]);
                  },
                  child: const FittedBox(child: Text("Change Password")))),
        ],
      ),
    );
  }

  SizedBox _profileDetails(double currentWidth) {
    return SizedBox(
      height: 700,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border(
                    bottom: BorderSide(color: Colors.black.withOpacity(0.2)))),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text("Edit Details",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF205e81))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                width: (currentWidth * 0.8) * 0.7,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                // decoration: const BoxDecoration(color: Colors.red),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: _profileController.userDetails["email"],
                            heading: "Email"),
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: _profileController.userDetails["mobile"],
                            heading: "Mobile Number"),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "Weight"),
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "BMI"),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "Height"),
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "Occupation"),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "Company Name"),
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "Gst Number"),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        _profileDetailsCard(
                            parentBoxwidth: (currentWidth * 0.8) * 0.7,
                            details: "NA",
                            heading: "Corp Code"),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  UnconstrainedBox _profileDetailsCard(
      {required parentBoxwidth, required heading, required details}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: parentBoxwidth * 0.4,
        // color: const Color.fromARGB(255, 27, 201, 15),
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(details,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 15))
          ],
        ),
      ),
    );
  }

  Container _leftSection(
    double currentWidth,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: (currentWidth * 0.8) * 0.25,
      height: 650,
      child: Column(
          children: [_userCard(currentWidth), _optionsSection(currentWidth)]),
    );
  }

  Expanded _optionsSection(double currentWidth) {
    return Expanded(
      child: SizedBox(
        // color: Colors.amber,
        width: (currentWidth * 0.8) * 0.25,
        child: Column(
          children: [
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "Account Info",
              icon: Icons.person,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "Galf Coins",
              icon: Icons.monetization_on,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "Manage Address",
              icon: Icons.settings,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "My Orders",
              icon: Icons.local_mall,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "My Events",
              icon: Icons.calendar_month,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "Settings",
              icon: Icons.tune,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "Wishlist",
              icon: Icons.favorite_border,
              selectedButton: _profileController.selectedButton.toString(),
            ),
            // _titleTileOptionButton(
            //   currentWidth: currentWidth,
            //   title: "Change Password",
            //   icon: Icons.manage_accounts,
            //   selectedButton: _profileController.selectedButton.toString(),
            // ),
            _titleTileOptionButton(
              currentWidth: currentWidth,
              title: "Logout",
              icon: Icons.power_settings_new,
              selectedButton: _profileController.selectedButton.toString(),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _userCard(double currentWidth) {
    return SizedBox(
      // color: Colors.red,
      width: (currentWidth * 0.8) * 0.25,
      // height: 180,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                "https://e7.pngegg.com/pngimages/348/800/png-clipart-man-wearing-blue-shirt-illustration-computer-icons-avatar-user-login-avatar-blue-child.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Welcome",
            style: TextStyle(color: Color(0xFF929292)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            _profileController.userDetails["fullName"],
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ],
      ),
    );
  }

  InkWell _titleTileOptionButton(
      {required double currentWidth,
      required title,
      required icon,
      required selectedButton}) {
    return InkWell(
      onTap: () {
        if (title == "Logout") {
          _loginController.getStorage({});
          storage.remove("loggedUserDetails");
          _cartController.cartList([]);
          Future.delayed(Duration.zero, () async {
            Get.toNamed("/");
          });
        } else {
          // if (title == "My Orders") {
          //   print(_profileController.myOrdersList);
          // }
          _profileController.selectedButton(title);
        }
      },
      child: Container(
          margin: const EdgeInsets.only(top: 15),
          height: 40,
          decoration: BoxDecoration(
              color: selectedButton == title
                  ? const Color(0xFF205e81)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          width: ((currentWidth * 0.8) * 0.25) * 0.9,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: selectedButton == title ? Colors.white : Colors.black,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color:
                        selectedButton == title ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          )),
    );
  }

  Widget _pageTitle({required currentWidth}) {
    return Container(
      color: Colors.white,
      width: currentWidth,
      height: 80,
      child: UnconstrainedBox(
        child: SizedBox(
          width: currentWidth * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Accounts',
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "HOME / ACCOUNTS",
                style:
                    GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
