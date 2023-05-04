import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/constant.dart';
import '../../components/footer.dart';
import '../../components/navbar.dart';
import '../../components/request_callback/request_callback.dart';
import './contact_controller.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final xController = Get.find<ContactController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String contactfullName = '';
  String contactEmail = '';
  String contactMobile = '';
  String contactMessage = '';
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
      body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Obx(
                () => xController.isLoading.value
                    ? myLoader
                    : ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Navbar(
                              currentScreen: currentScreen,
                              selected: 'contact'),
                          const SizedBox(
                            height: 20,
                          ),
                          _contactUpperSection(
                              context: context, currentScreen: currentScreen),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/contact_bg.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 80,
                                ),
                                _formDetailsUpperSection(
                                    context: context,
                                    currentScreen: currentScreen,
                                    xController: xController),
                                const SizedBox(
                                  height: 290,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Footer(context: context),
                        ],
                      ),
              ),
              const RequestCallback()
            ],
          )),
    );
  }

  Widget _contactUpperSection({required context, required currentScreen}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            SizedBox(
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF363636),
                ),
              ),
            ),
            SizedBox(
              child: Text(
                'Home / Contact us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF363636),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formDetailsUpperSection(
      {required context, required currentScreen, required xController}) {
    return UnconstrainedBox(
      child: SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 484,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "We are available",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 24/7',
                              style: TextStyle(
                                color: Color(0xFF205E81),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem",
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.wifi_calling_3,
                              size: 30.0,
                              color: Color(0xFF00578F),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              xController.contactList[0].mobile.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF575757),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.email,
                              size: 30.0,
                              color: Color(0xFF00578F),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "hello@demoemail.com",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF575757),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.place,
                              size: 30.0,
                              color: Color(0xFF00578F),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "931  Abia Martin Drive, PA\nPennsylvania-18104",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF575757),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                // html.window.open(
                                //     "http://localhost:65335/#/about-us",
                                //     "_blank");
                              }, // Image tapped
                              child: const ImageIcon(
                                AssetImage(
                                    "assets/images/contact_facebook.png"),
                                size: 50.0,
                                color: Color(0xFF00578F),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            InkWell(
                              onTap: () {
                                // html.window.open(
                                //     "http://localhost:65335/#/about-us",
                                //     "_blank");
                              }, // Image tapped
                              child: const ImageIcon(
                                AssetImage("assets/images/contact_twiter.png"),
                                size: 50.0,
                                color: Color(0xFF00578F),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            InkWell(
                              onTap: () {
                                // html.window.open(
                                //     "http://localhost:65335/#/about-us",
                                //     "_blank");
                              }, // Image tapped
                              child: const ImageIcon(
                                AssetImage("assets/images/contact_linkdin.png"),
                                size: 50.0,
                                color: Color(0xFF00578F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 484,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0091F5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            iconColor: Color(0xFFFFFFFF),
                            focusColor: Color(0xFFFFFFFF),
                            hoverColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Email',
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            iconColor: Color(0xFFFFFFFF),
                            focusColor: Color(0xFFFFFFFF),
                            hoverColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: TextField(
                          controller: mobileController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mobile Number',
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            iconColor: Color(0xFFFFFFFF),
                            focusColor: Color(0xFFFFFFFF),
                            hoverColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          controller: messageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message',
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            iconColor: Color(0xFFFFFFFF),
                            focusColor: Color(0xFFFFFFFF),
                            hoverColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF205E81),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: "Enquiry For ",
                                style: const TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Vendor Registration",
                                    style: const TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed("/");
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
