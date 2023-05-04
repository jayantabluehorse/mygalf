import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/cart/cart_controller.dart';
import 'package:my_galf/pages/login/login_controller.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  final GetStorage storage = GetStorage();

  final LoginController _loginController = Get.find<LoginController>();
  final CartController _cartController = Get.find<CartController>();
  // final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
    super.initState();
  }

  bool _rememberPassword = false;
  @override
  Widget build(BuildContext context) {
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
        flexibleSpace: Navbar(currentScreen: currentScreen, selected: 'login'),
      ),
      body:
          // const Text("data")

          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(currentWidth),
            const Divider(
              color: Colors.black,
            ),
            SizedBox(
              width: double.infinity,
              height: 800,
              child: Stack(
                children: [
                  Container(
                    height: 800,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/loginBg.png"))),
                  ),
                  Positioned(
                      right: 200,
                      top: 30,
                      child: _loginForm(currentWidth: currentWidth))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _loginForm({required currentWidth}) {
    return SizedBox(
      // height: 600,
      width: currentWidth * 0.35,
      // color: const Color.fromARGB(255, 224, 177, 174),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFF0077cc),
            // backgroundImage: AssetImage(assetName),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome",
            style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 40)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: currentWidth * 0.35,
              height: 50,
              child: TextField(
                controller: _loginController.emailController,
                decoration: const InputDecoration(
                    hintText: "Enter Email", prefixIcon: Icon(Icons.person)),
              )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: currentWidth * 0.35,
              height: 50,
              child: TextField(
                obscureText: true,
                controller: _loginController.passController,
                decoration: const InputDecoration(
                    hintText: "Password", prefixIcon: Icon(Icons.lock)),
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: currentWidth * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _rememberPassword,
                      onChanged: (value) {
                        setState(() {
                          _rememberPassword = !_rememberPassword;
                        });
                      },
                      activeColor: const Color(0xFF205e81),
                    ),
                    const Text("Remember me"),
                  ],
                ),
                const Text("Forgot password?"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _loginController.isLoading == true
              ? spinnerLoader
              : SizedBox(
                  width: currentWidth * 0.35,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF205e81)),
                      onPressed: () {
                        _loginController.signinApiCall(
                            context: context, cartController: _cartController);
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.rubik(textStyle: const TextStyle()),
                      ))),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: currentWidth * 0.35,
              height: 50,
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color(0xFFb3b3b3),
                    child: Text(
                      "OR",
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(child: Divider()),
                ],
              )),
          SizedBox(
            width: currentWidth * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialLoginButton(
                    icon: "assets/icons/google_icon.png",
                    label: "Google",
                    hexCode: 0xFF810206),
                const SizedBox(
                  width: 20,
                ),
                _socialLoginButton(
                    icon: "assets/icons/facebook_white.png",
                    label: "Facebook",
                    hexCode: 0xFF021781),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: currentWidth * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(textStyle: const TextStyle()),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(color: Colors.blue)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _socialLoginButton(
      {required String label, required String icon, required int hexCode}) {
    return SizedBox(
      height: 35,
      width: 120,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(hexCode),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () {},
          icon: Image.asset(
            icon,
            height: 30,
            width: 30,
          ),
          label: Text(
            label,
            style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 10)),
          )),
    );
  }

  SizedBox _pageTitle(currentWidth) {
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
}

Widget loginTop() {
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

Widget loginContent(currentWidth) {
  return SizedBox(
    child: Stack(
      children: [
        // Background(currentWidth),
        bgImage(currentWidth),
        Positioned(top: 40, right: 120, child: loginForm()),
      ],
    ),
  );
}

Widget background(currentWidth) {
  return Container(
    width: currentWidth,
    height: 545,
    color: const Color.fromARGB(38, 47, 183, 37),
  );
}

Widget bgImage(currentWidth) {
  return Container(
    height: 545,
    width: currentWidth / 1.5,
    color: const Color.fromARGB(29, 33, 149, 243),
    child: Image.asset("assets/images/loginBg.png"),
  );
}

Widget loginForm() {
  return Container(
    color: const Color.fromARGB(52, 244, 67, 54),
    height: 500,
    width: 500,
  );
}
