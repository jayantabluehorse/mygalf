import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/navbar.dart';
import "./signup_controller.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignupController _signupController = Get.find<SignupController>();

  // Map data = {};

  // bool isreadTerm = false;

  // const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
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
              Navbar(currentScreen: currentScreen, selected: 'signup'),
        ),
        body: Obx(
          () => Stack(
            children: [
              ListView(
                children: [
                  loginTop(currentWidth: currentWidth),
                  const Divider(
                    color: Colors.black,
                  ),
                  Background(currentWidth)
                ],
              ),
              Container(
                height: currentHeight,
                color: const Color.fromARGB(48, 0, 0, 0),
              ),
              Container(
                width: currentWidth,
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: currentHeight / 1.5 + 50,
                  width: currentWidth <= 1100
                      ? currentWidth * 0.6
                      : currentWidth * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/login");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        // color: Colors.red,
                        child: Column(
                          children: [
                            textFeildWidget(_signupController.emailController,
                                "Enter Email"),
                            const SizedBox(height: 15),
                            textFeildWidget(
                                _signupController.nameController, "Full Name"),
                            const SizedBox(height: 15),
                            textFeildWidget(_signupController.phoneController,
                                "Phone Number"),
                            const SizedBox(height: 15),
                            textFeildWidget(_signupController.passController,
                                "Password * (min 8 characters)"),
                            const SizedBox(height: 15),
                            textFeildWidget(_signupController.conPassController,
                                " Confirmed Password"),
                            const SizedBox(height: 10),
                            _signupController.isError.value
                                ? Text(
                                    _signupController.errorMessage.value,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  )
                                : const Text(""),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: _signupController.isreadTerm.value,
                                    onChanged: (_) {
                                      // setState(() {
                                      _signupController.isreadTerm(
                                          !_signupController.isreadTerm.value);
                                      //  _signupController.isreadTerm
                                      //     ?  _signupController.isreadTerm () false
                                      //     : isreadTerm = true;
                                      // });
                                    }),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("I agree to the"),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed("/term");
                                      },
                                      child: const Text(
                                        " Privacy policy",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 32, 93, 129),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Text("  and "),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed("/tern");
                                      },
                                      child: const Text(
                                        " Terms of service.",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 32, 93, 129),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                _signupController.signUpApiCall(
                                    context: context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 405,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 32, 93, 129),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                // ignore: prefer_const_constructors
                                child: Text(
                                  _signupController.isLoading.value
                                      ? "Loading"
                                      : "Sign up",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed("/login");
                                  },
                                  child: const Text("Sign In",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 32, 93, 129),
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget loginTop({required currentWidth}) {
    return SizedBox(
      width: currentWidth * 0.8,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Login',
            style: GoogleFonts.rubik(
              textStyle:
                  const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "HOME / LOGIN",
            style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Background(currentWidth) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      width: currentWidth,
      constraints: const BoxConstraints(maxHeight: 548),
      // height: 548,
      child: Image.asset(
        "assets/images/signupbg.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget textFeildWidget(controller, hintName) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        // print(controller.  );
      },
      decoration: InputDecoration(
        hintText: hintName,
        filled: true,
        fillColor: const Color.fromARGB(55, 158, 158, 158),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
      ),
      style: const TextStyle(
        fontSize: 15,
      ),
    );
  }
}
