import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_galf/components/navbar.dart';

import 'constant/constant.dart';
import 'widget/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passController = TextEditingController();

  final _conPassController = TextEditingController();

  var _finalPass = "";

  bool _isError = false;
  Map data = {};

  String _errorMessage = "";

  bool isreadTerm = false;

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
      body: Stack(
        children: [
          Column(
            children: [
              Navbar(currentScreen: currentScreen),
              LoginTop(),
              Background(currentWidth)
            ],
          ),
          Container(
            height: currentHeight,
            color: const Color.fromARGB(48, 0, 0, 0),
          ),
          Container(
            height: currentHeight,
            width: currentWidth,
            padding: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: currentHeight / 1.5 + 50,
              width: (currentWidth / 3) - 50,
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        TextFeildWidget(_emailController, "Enter Email"),
                        const SizedBox(height: 15),
                        TextFeildWidget(_nameController, "Full Name"),
                        const SizedBox(height: 15),
                        TextFeildWidget(_phoneController, "Phone Number"),
                        const SizedBox(height: 15),
                        TextFeildWidget(
                            _passController, "Password * (min 8 characters)"),
                        const SizedBox(height: 15),
                        TextFeildWidget(
                            _conPassController, " Confirmed Password"),
                        const SizedBox(height: 10),
                        _isError
                            ? Text(
                                _errorMessage,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red),
                              )
                            : Text(""),
                        Row(
                          children: [
                            Checkbox(
                                value: isreadTerm,
                                onChanged: (_) {
                                  setState(() {
                                    isreadTerm
                                        ? isreadTerm = false
                                        : isreadTerm = true;
                                  });
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
                                        color: Color.fromARGB(255, 32, 93, 129),
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
                                        color: Color.fromARGB(255, 32, 93, 129),
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
                            signUpApiCall();
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
                              "Sign up",
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
                                      color: Color.fromARGB(255, 32, 93, 129),
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
    );
  }

  Widget LoginTop() {
    return Container(
      padding: const EdgeInsets.only(left: 160, right: 160),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            " Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(" HOME/LOGIN"),
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

  void signUpApiCall() {
    if (_phoneController.text == "" ||
        _nameController.text == "" ||
        _emailController == "") {
      setState(() {
        _isError = true;
        _errorMessage = " All feilds are required";
      });
    } else if (_passController.text != _conPassController.text) {
      setState(() {
        _finalPass = _passController.text;
        _isError = true;
        _errorMessage = " Password Mismatched";
      });
      // showErrorMessage();
    } else if (_passController.text.length < 8 &&
        _conPassController.text.length < 8) {
      setState(() {
        _isError = true;
        _errorMessage = " Password Should be atleast 8 Characters";
      });
    } else {
      setState(() {
        _finalPass = _passController.text;
        _isError = false;
        data = {
          "email": _emailController.text,
          "name": _nameController.text,
          "phone": _phoneController.text,
          "password": _finalPass,
          "isreadTerm": isreadTerm
        };
      });
      print(data);
    }
  }
}
