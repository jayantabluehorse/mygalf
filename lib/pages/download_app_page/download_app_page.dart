import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/footer.dart';
import '../../components/navbar.dart';
import '../../components/request_callback/request_callback.dart';
import './download_app_controller.dart';

class DownloadAppPage extends StatefulWidget {
  const DownloadAppPage({Key? key}) : super(key: key);

  @override
  _DownloadAppPageState createState() => _DownloadAppPageState();
}

class _DownloadAppPageState extends State<DownloadAppPage> {
  final xController = Get.put(DownloadAppController());
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
        flexibleSpace:
            Navbar(currentScreen: currentScreen, selected: 'download app'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _downloadAppUpperSection(
                    context: context, currentScreen: currentScreen),
                const SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 2200,
                  child: Stack(children: [
                    Positioned(
                      top: 1600,
                      child: _shopUxUi(
                          context: context, currentScreen: currentScreen),
                    ),
                    Positioned(
                        top: 450,
                        child: _createEventsUxUi(
                            context: context, currentScreen: currentScreen)),
                    Positioned(
                        top: 1030,
                        child: _eventsUxUi(
                            context: context, currentScreen: currentScreen)),
                    Positioned(
                      top: 0,
                      left: 0,
                      // height: 290,
                      child: _fitnessLoungeUxUi(
                          context: context, currentScreen: currentScreen),
                    ),
                  ]),
                ),
                Footer(context: context),
              ],
            ),
          ),
          const RequestCallback()
        ],
      ),
    );
  }

  Widget _downloadAppUpperSection({required context, required currentScreen}) {
    return UnconstrainedBox(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/ecosystem_banner.jpg"),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "MyGALF App",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 33,
                      color: Color(0xFF363636),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Home/MyGALF App",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF363636),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shopUxUi({required context, required currentScreen}) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      // alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/rectangle_bg.png"))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fitness Lounge",
                  style: GoogleFonts.rubik(fontSize: 40, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "High Quality Content\nPush notoifications for subscribed content\nSuperior playback and ease of read ",
                  style: GoogleFonts.rubik(fontSize: 25, color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 200,
          ),
          Image.asset("assets/images/layer_4.png"),
        ],
      ),
    );
  }

  Widget _eventsUxUi({required context, required currentScreen}) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/layer_3.png",
              fit: BoxFit.fill,
              width: 350,
              height: 500,
            ),
          ),
          Container(
            width: 200,
          ),
          SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create An Event",
                  style: GoogleFonts.rubik(fontSize: 45),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Guided Event Creation\nChoose from over 10 templates\nView gallery of completed events ",
                  style: GoogleFonts.rubik(fontSize: 25, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createEventsUxUi({required context, required currentScreen}) {
    return Container(
      height: 675,
      width: MediaQuery.of(context).size.width,
      // alignment: Alignment.center,
      decoration: const BoxDecoration(),

      child: Stack(alignment: Alignment.center, children: [
        // background
        Container(
          height: 450,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/rectangle_bg.png"))),
        ),

//main-content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 100,
            ),
            SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Events",
                    style: GoogleFonts.rubik(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Priority Registration\nQuick Fill Process\nSpecial offers for in-app registrations\nEvent reminder notifications",
                    style: GoogleFonts.rubik(fontSize: 25, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 170,
                ),
                Image.asset(
                  "assets/images/layer_2.png",
                  width: 350,
                  height: 500,
                )
              ],
            )
          ],
        )
      ]),
    );
  }

  Widget _fitnessLoungeUxUi({required context, required currentScreen}) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/layer1.png"),
          const SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shop",
                  style: GoogleFonts.rubik(fontSize: 40),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Great UI and UX \nSpecial offers for orders through the appMore GALF coins credited to account on purchase via app ",
                  style: GoogleFonts.rubik(fontSize: 25, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
