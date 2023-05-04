import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/forgotPassword/widgets/widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  Map data = {};

  // const ForgotPasswordPage({super.key});
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
              Navbar(currentScreen: currentScreen, selected: 'forgotPass'),
              LoginTop(),
              Background(currentWidth)
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: currentHeight,
            width: currentWidth,
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
                color: Color.fromARGB(255, 32, 93, 129),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    width: (currentWidth / 3) - 50,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.blueAccent,
                      height: currentHeight / 2,
                      child: Column(
                        children: [
                          const SizedBox(height: 120),
                          SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  color:
                                      const Color.fromARGB(66, 158, 158, 158),
                                  width: 120,
                                  height: 1,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(66, 158, 158, 158),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Text("OR"),
                                ),
                                Container(
                                  color:
                                      const Color.fromARGB(66, 158, 158, 158),
                                  width: 120,
                                  height: 1,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
//social media icon

                          SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width: 110,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    color: Color.fromARGB(255, 96, 12, 6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/google.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      const Text(
                                        "Google",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 110,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    color: Color.fromARGB(255, 1, 20, 87),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "f",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text(
                                        "facebook",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed("/login");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 320,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 13, 47, 67),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Sign In",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't Have Account ?  ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                  child: const Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline),
                                  ),
                                  onTap: () {
                                    Get.toNamed("/signup");
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 260,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
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
                          "RESET PASSWORD",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              textFeildWidget(_emailController, "Enter Email"),
                              const SizedBox(
                                height: 20,
                              ),

                              //submit button

                              InkWell(
                                onTap: () {
                                  // isEmailCorrect?
                                  sendLink();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 405,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 32, 93, 129),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "Submit",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
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

  // ignore: non_constant_identifier_names
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

  void sendLink() {
    if (_emailController.text != "") {
      data = {"email": _emailController};
      // print(data);
    }
  }
}
