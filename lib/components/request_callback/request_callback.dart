import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/request_callback/request_callback_controller.dart';
import 'package:get_storage/get_storage.dart';

class RequestCallback extends StatefulWidget {
  const RequestCallback({super.key});

  @override
  State<RequestCallback> createState() => _RequestCallbackState();
}

class _RequestCallbackState extends State<RequestCallback> {
  final RequestCallBackController _requestCallBackController =
      Get.put(RequestCallBackController());

  var storage = GetStorage();

  @override
  void initState() {
    super.initState();

    if (storage.read("loggedUserDetails") != null) {
      _requestCallBackController.mobile.text =
          storage.read("loggedUserDetails")["fullName"];
      _requestCallBackController.name.text =
          storage.read("loggedUserDetails")["mobile"];
    } else {
      _requestCallBackController.mobile.text = "";
      _requestCallBackController.name.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        right: 0,
        bottom: MediaQuery.of(context).size.height / 5,
        child: Row(
          children: [
            InkWell(
                onTap: _requestCallBackController.handleIsOpen,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 10, 83, 155),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  height: MediaQuery.of(context).size.height / 2,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "R E Q U E S T   A    C A L L B A C K",
                      style: TextStyle(
                          wordSpacing: 3, fontSize: 16, color: Colors.white),
                    ),
                  ),
                )),
            // _requestCallBackController.isOpen.value
            //     ?
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height / 2,
              width: _requestCallBackController.isOpen.value ? 300 : 0,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(25, 0, 0, 0),
                    blurRadius: 5,
                    spreadRadius: 5)
              ]),
              child: ListView(
                children: [
                  SizedBox(
                    child: Column(
                      children: const [
                        Text(
                          "Get A Callback",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10),
                        Text("Please Provide These Details"),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name"),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _requestCallBackController.name,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      Text(
                        _requestCallBackController.nameError.value
                            ? "please enter name"
                            : "",
                        style: const TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Mobile Number"),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _requestCallBackController.mobile,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      _requestCallBackController.numberError.value
                          ? const Text(
                              "please enter number",
                              style: TextStyle(color: Colors.red),
                            )
                          : const Text("")
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _requestCallBackController.submitRequest();
                      print({
                        "name": _requestCallBackController.name.text,
                        "mobile": _requestCallBackController.mobile.text
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(7)),
                      height: 45,
                      width: 150,
                      child: const Text(
                        "Send Rquest",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
            // : const SizedBox()
          ],
        ),
      ),
    );
  }
}
