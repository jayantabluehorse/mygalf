import 'package:flutter/material.dart';
import '../newLogin/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:my_galf/components/constant.dart';

showLogin(BuildContext context) { 
  final AuthController authController = Get.find<AuthController>();
  // final myController = TextEditingController();

  double logheight = MediaQuery.of(context).size.height;
  double logwidth = MediaQuery.of(context).size.width;

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: const EdgeInsets.all(5.0),
    content: Container(
      padding: const EdgeInsets.all(10),
      height: logheight < 700 ? logheight / 2 : logheight / 2.1,
      width: logwidth < 1024 ? logwidth / 2.5 : logwidth / 3.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.cancel,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            width: logwidth < 1245 ? logwidth / 2.5 : logwidth / 4,
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: const [
                      Text("Welcome to MyGALF",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                          "Hey, enter your mobile number to login and get free MyGALF membership & discounts.",
                          style: TextStyle(fontSize: 12)),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  child: TextField(
                    controller: authController.mobileController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    //maxLength: 10,

                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Moibile Number",
                    ),
                  ),
                ),
                Obx(
                  () => authController.isError == true
                      ? SizedBox(
                          width:
                              logwidth < 1245 ? logwidth / 2.5 : logwidth / 4,
                          child: Text(
                            authController.errorMessage.toString(),
                            style: const TextStyle(
                                color: Colors.red, fontSize: 10),
                            textAlign: TextAlign.left,
                          ))
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: logwidth < 1245
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "By continuing you are agreed ",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print("term & condition page");
                                    },
                                    child: const Text(
                                      " Terms and Conditions ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF205e81)),
                                    ),
                                  ),
                                  const Text(
                                    " and ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("term & condition page");
                                    },
                                    child: const Text(
                                      " Privacy",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF205e81)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "By continuing you are agreed ",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                                child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print("term & condition page");
                                  },
                                  child: const Text(
                                    " Terms and Conditions ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xFF205e81)),
                                  ),
                                ),
                                const Text(
                                  " and ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                InkWell(
                                  onTap: () {
                                    print("term & condition page");
                                  },
                                  child: const Text(
                                    " Privacy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xFF205e81)),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                ),
                const SizedBox(height: 15),
          Obx(() =>  authController.isLoading == true ? SpinKitFadingCircle(
                   color: Colors.blue,
                   size: 50.0,
                  )   : InkWell(
                  onTap: () {
                    authController.signinApiCall(context: context);
                    // Navigator.pop(context);
                    //Navigator.pushReplacementNamed( context, showotp(context, myController));
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color(0xFF205e81),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
          )
              ],
            ),
          )
        ],
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
