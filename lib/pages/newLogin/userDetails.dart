import 'package:flutter/material.dart';
import './auth_controller.dart';
import 'package:get/get.dart';

showDetailsPopUp(BuildContext context, mobile) {
  final AuthController _authController = Get.find<AuthController>();
  double logheight = MediaQuery.of(context).size.height;
  double logwidth = MediaQuery.of(context).size.width;

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: const EdgeInsets.all(5.0),
    content: Container(
        padding: const EdgeInsets.all(10),
        // height: logheight / 2,
        // width: logwidth / 3.5,
        height: logheight < 670 ? logheight / 1.8 : logheight / 2,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: logwidth < 1245 ? logwidth / 2.5 : logwidth / 4,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: Row(
                      children: [
                        Text(mobile),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: TextField(
                      controller: _authController.fullName,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Full name",
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: TextField(
                      controller: _authController.email,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Email Address",
                      ),
                    ),
                  ),
                  Obx(
                    () => _authController.isError == true
                        ? SizedBox(
                            width:
                                logwidth < 1245 ? logwidth / 2.5 : logwidth / 4,
                            child: Text(
                              _authController.errorMessage.toString(),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 10),
                              textAlign: TextAlign.left,
                            ))
                        : const SizedBox(),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _authController.signUp(context: context);
                      //Navigator.pop(context);
                      // Navigator.popAndPushNamed(context, showotp(context));
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
                            "Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
