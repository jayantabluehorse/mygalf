import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/corporate_wellness_page/corporate_wellness_controller.dart';

import '../../components/colors.dart';
//import '../../components/request_callback/requestCallBack.dart';
import '../../components/footer.dart';
import '../../components/request_callback/request_callBack.dart';
import '../../utils/icons.dart';

class WellnessPage extends StatefulWidget {
  const WellnessPage({super.key});

  @override
  State<WellnessPage> createState() => _CorporateWellnessPageState();
}

class _CorporateWellnessPageState extends State<WellnessPage> {
  final xController = Get.put(WellnessController());
  bool _checkboxListTile = false;
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    final currentWidth = MediaQuery.of(context).size.width;
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
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Navbar(currentScreen: currentScreen, selected: 'wellnesspage'),
              wellnessEcosystemUpperSection(
                  context: context, currentScreen: currentScreen),
              const SizedBox(
                height: 54,
              ),
              UnconstrainedBox(
                child: Container(
                  width: (MediaQuery.of(context).size.width) * 0.7,
                  height: 400,
                  // color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:
                              ((MediaQuery.of(context).size.width) * 0.7) * 0.5,
                          child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  "WELLNESS @ WORK",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                    maxLines: 7,
                                    softWrap: true,
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras pretium finibus tellus ornare congue. Nulla facilisi. Nullam at mauris ac libero suscipit blandit. Praesent luctus purus sem. Vestibulum interdum, sapien vel vestibulum tempor, mi ex rutrum metus, eget ornare tortor mauris sit amet eros."),
                                SizedBox(
                                  height: 65,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF2f80dc)),
                                    onPressed: () {},
                                    child: Text("Get Free Consulting"))
                              ]),
                        ),
                        Image.asset("assets/images/Wellness_page.png"),
                      ]),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "WHAT MAKES OUR PROGRAM",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  // SizedBox(
                  //   width: (MediaQuery.of(context).size.width) * 0.2,
                  //   child: Divider(thickness: 2, color: Color(0xFF2f80dc)),
                  // ),
                  Text(
                    " SUCCESSFUL",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2f80dc)),
                  ),
                ],
              ),
              SizedBox(
                height: 65,
              ),
              UnconstrainedBox(
                child: Container(
                  height: 500,
                  width: (MediaQuery.of(context).size.width) * 0.7,
                  // color: Colors.green,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 230,
                          // color: Colors.grey,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _ourProgram(
                                    icon: "assets/icons/wellness_primary.png",
                                    title: "Primary Care",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                _ourProgram(
                                    icon: "assets/icons/wellness_mental.png",
                                    title: "Mental Wellness",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                _ourProgram(
                                    icon: "assets/icons/wellness_health.png",
                                    title: "Health Checks",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                _ourProgram(
                                    icon: "assets/icons/wellness_fitness.png",
                                    title: "Fitness Benefits",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                              ]),
                        ),
                        Container(
                          height: 230,
                          // color: Colors.amber,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _ourProgram(
                                    icon: "assets/icons/wellness_helpline.png",
                                    title: "Help Line",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                _ourProgram(
                                    icon:
                                        "assets/icons/wellness_customized.png",
                                    title: "Customise Programs",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                _ourProgram(
                                    icon: "assets/icons/wellness_primary.png",
                                    title: "Data Analytics",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),
                                _ourProgram(
                                    icon: "assets/icons/wellness_step.png",
                                    title: "Step Challenges",
                                    discription:
                                        "Primary care refers to the first level of healthcare that is typically provided by healthcare professionals."),

                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                                // Container(
                                //   width: 225,
                                //   color: Colors.red,
                                // ),
                              ]),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 62,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOREM IPSUM DOLOR SIT AMET",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              UnconstrainedBox(
                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width * 0.7,
                  // color: Colors.blueGrey,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _subscriptionPlan(context),
                        _subscriptionPlan(context),
                        _subscriptionPlan(context),
                        // Container(
                        //   color: Colors.red,
                        //   width:
                        //       (MediaQuery.of(context).size.width * 0.7) * 0.3,
                        // ),
                        // Container(
                        //   color: Colors.red,
                        //   width:
                        //       (MediaQuery.of(context).size.width * 0.7) * 0.3,
                        // ),
                      ]),
                ),
              ),
              UnconstrainedBox(
                child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2f80dc)),
                        onPressed: () {},
                        child: Text('Make Your Package'))),
              ),
              SizedBox(
                height: 65,
              ),
              UnconstrainedBox(
                child: Container(
                  height: 700,
                  width: MediaQuery.of(context).size.width * 0.7,
                  // color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:
                              (MediaQuery.of(context).size.width * 0.7) * 0.45,
                          child: Column(children: [
                            Container(
                              height: 250,
                              // color: Colors.amber,
                              child: Column(children: [
                                Text(
                                  "Schedule a Demo & \nGet a Quote",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                    "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Cras pretium finibus tellus ornare \ncongue."),
                              ]),
                            ),
                            Image.asset("assets/images/MyGalf_wellness.png"),
                          ]),
                        ),
                        SizedBox(
                          width:
                              (MediaQuery.of(context).size.width * 0.7) * 0.5,
                          child: Column(children: [
                            Container(
                              // color: Colors.pink,
                              height: 140,
                            ),
                            Container(
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          ((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  0.5) *
                                              0.47,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "First Name",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    SizedBox(
                                      width:
                                          ((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  0.5) *
                                              0.47,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Last Name",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email Address",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Contact Number",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Company",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Number of employees",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // TextField(
                                //   decoration: InputDecoration(
                                //     border: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 1),
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(12)),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Row(children: [
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CheckboxListTile(
                                              // title: Text("Done"),
                                              value: _checkboxListTile,
                                              onChanged: (value) {
                                                setState(() {
                                                  _checkboxListTile =
                                                      !_checkboxListTile;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text("I'm not a robot"),
                                          ],
                                        )
                                      ]),
                                    ),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    Column(children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Image.asset(
                                          "assets/images/wellness_capta.png"),
                                    ]),
                                  ],
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF2f80dc)),
                                onPressed: () {},
                                child: Text('Contact Us')),
                          ]),
                        ),
                      ]),
                ),
              ),
              Footer(context: context)

              // keyFeatures(
              //   context: context,
              //   currentScreen: currentScreen,
              //   title: 'Key Features',
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 8.0,
              //     bottom: 35,
              //   ),
              //   child: Center(
              //     child: Container(
              //       height: 3,
              //       width: 70,
              //       color: Colors.blue,
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SizedBox(
              //       height: 30,
              //       width: 20,
              //       child: ElevatedButton(
              //         style: OutlinedButton.styleFrom(
              //           padding: EdgeInsets.zero,
              //           backgroundColor: Colors.grey,
              //         ),
              //         onPressed: () {
              //           scrollController.animateTo(
              //             scrollController.offset - 300.0,
              //             duration: const Duration(milliseconds: 500),
              //             curve: Curves.ease,
              //           );
              //         },
              //         child: const Icon(
              //           Icons.arrow_back_ios,
              //           color: Colors.white,
              //           size: 15,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: SizedBox(
              //         height: 110,
              //         width: MediaQuery.of(context).size.width * 0.97,
              //         child: ListView.builder(
              //           padding: const EdgeInsets.only(
              //             left: 5,
              //           ),
              //           controller: scrollController,
              //           shrinkWrap: true,
              //           scrollDirection: Axis.horizontal,
              //           itemCount: xController.featuresList.length,
              //           itemBuilder: (context, index) {
              //             return featuresList(index: index);
              //           },
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 30,
              //       width: 20,
              //       child: ElevatedButton(
              //         style: OutlinedButton.styleFrom(
              //           padding: EdgeInsets.zero,
              //           backgroundColor: Colors.grey,
              //         ),
              //         child: const Icon(
              //           Icons.arrow_forward_ios,
              //           color: Colors.white,
              //           size: 15,
              //         ),
              //         onPressed: () {
              //           scrollController.animateTo(
              //             scrollController.offset + 300.0,
              //             duration: const Duration(milliseconds: 500),
              //             curve: Curves.ease,
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //  height: 20,
              //    ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: const BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(
              //           "assets/images/carv.png",
              //         ),
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //     height: 800,
              //     width: 200,
              //     child: Row(
              //       children: <Widget>[
              //         Expanded(
              //           child: Column(
              //             children: [
              //               const SizedBox(
              //                 height: 100,
              //               ),
              //               SizedBox(
              //                 child: Image.asset(
              //                   "assets/images/mobile.png",
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 50,
              //         ),
              //         Expanded(
              //           child: Column(
              //             // direction: Axis.vertical,
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               const SizedBox(
              //                 height: 100,
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     "Download ",
              //                     style: GoogleFonts.rubik(
              //                       textStyle: const TextStyle(
              //                         fontSize: 50,
              //                         color: Color.fromARGB(255, 13, 113, 196),
              //                         fontWeight: FontWeight.w700,
              //                         fontStyle: FontStyle.italic,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     "our",
              //                     style: GoogleFonts.rubik(
              //                       textStyle: const TextStyle(
              //                         fontSize: 50,
              //                         fontWeight: FontWeight.w700,
              //                         fontStyle: FontStyle.italic,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Text(
              //                 "new app",
              //                 style: GoogleFonts.rubik(
              //                   textStyle: const TextStyle(
              //                     fontSize: 50,
              //                     fontWeight: FontWeight.w700,
              //                     fontStyle: FontStyle.italic,
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 20,
              //               ),
              //               Text(
              //                 "Manage all Employee Wellness activities with one",
              //                 style: GoogleFonts.rubik(
              //                   textStyle: const TextStyle(
              //                     fontSize: 17,
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 5,
              //               ),
              //               Text(
              //                 "Subscription Under one Platform",
              //                 style: GoogleFonts.rubik(
              //                   textStyle: const TextStyle(
              //                     fontSize: 17,
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 15,
              //               ),
              //               bulletedText(
              //                   text:
              //                       "Manage all Employee Wellness in one Platform"),
              //               const SizedBox(
              //                 height: 8,
              //               ),
              //               bulletedText(
              //                   text:
              //                       "Wellness Surveys, Strategies and Analytics"),
              //               const SizedBox(
              //                 height: 8,
              //               ),
              //               bulletedText(
              //                 text: "Leadership Dashboard",
              //               ),
              //               const SizedBox(
              //                 height: 8,
              //               ),
              //               bulletedText(
              //                 text: "Bonus Reward for Employees",
              //               ),
              //               const SizedBox(
              //                 height: 8,
              //               ),
              //               bulletedText(
              //                 text: "Access to Premium Events",
              //               ),
              //               const SizedBox(
              //                 height: 30,
              //               ),
              //               ElevatedButton(
              //                 onPressed: () {},
              //                 style: ElevatedButton.styleFrom(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(10),
              //                   ),
              //                   minimumSize: const Size(130, 45),
              //                   backgroundColor:
              //                       const Color.fromARGB(255, 27, 72, 109),
              //                 ),
              //                 child: Text(
              //                   "JOIN NOW",
              //                   style: GoogleFonts.rubik(
              //                     textStyle: const TextStyle(
              //                       fontStyle: FontStyle.normal,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 20,
              //               ),
              //               Row(
              //                 children: [
              //                   Container(
              //                     height: 90,
              //                     width: 100,
              //                     decoration: const BoxDecoration(
              //                       image: DecorationImage(
              //                         fit: BoxFit.fill,
              //                         image: AssetImage(
              //                           "assets/images/qrcode.png",
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   const SizedBox(
              //                     width: 25,
              //                   ),
              //                   Container(
              //                     height: 120,
              //                     width: 0.8,
              //                     color: Colors.grey,
              //                   ),
              //                   const SizedBox(
              //                     width: 25,
              //                   ),
              //                   Column(
              //                     children: [
              //                       GestureDetector(
              //                         onTap: () {},
              //                         child: Container(
              //                           height: 40,
              //                           width: 100,
              //                           decoration: const BoxDecoration(
              //                             image: DecorationImage(
              //                               fit: BoxFit.fill,
              //                               image: AssetImage(
              //                                   "assets/images/googleplay.png"),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                       const SizedBox(
              //                         height: 10,
              //                       ),
              //                       GestureDetector(
              //                         onTap: () {},
              //                         child: Container(
              //                           height: 40,
              //                           width: 100,
              //                           decoration: const BoxDecoration(
              //                             image: DecorationImage(
              //                               fit: BoxFit.fill,
              //                               image: AssetImage(
              //                                 "assets/images/appstore.png",
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
          RequestCallback(),
        ],
      ),
    );
  }

  Container _subscriptionPlan(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: (MediaQuery.of(context).size.width * 0.7) * 0.3,
      child: Column(children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                )
              ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text("ACTIVE",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Text("Basic"),
            ),
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 10,
              child: Image.asset("assets/icons/wellness_green_check.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("RS"),
                Text(
                  "300",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            Text("Per Employee/ Month"),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF2f80dc)),
              onPressed: () {},
              child: Text("Try Now"),
            ),
          ]),
        ),
        SizedBox(
          height: 70,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("(TBA) Basis Customzation request"),
            SizedBox(
              height: 8,
            ),
            Text("Plans may be customized basis needs"),
            SizedBox(
              height: 8,
            ),
            Text(
                softWrap: true,
                maxLines: 2,
                "The abave pricing is for a minimum of 100 employee count"),
            SizedBox(
              height: 8,
            ),
            Text(
                softWrap: true,
                maxLines: 2,
                "Exclusive pricing is based on a 3-year contract commitment"),
            SizedBox(
              height: 8,
            ),
            Text(
                softWrap: true,
                maxLines: 2,
                "Billing would be on a 6 monthly advance payment schedule"),
            SizedBox(
              height: 8,
            ),
            Text(
                softWrap: true,
                maxLines: 2,
                "Travle, logistics and taxes at actuals"),
          ],
        ),
      ]),
    );
  }

  Container _ourProgram(
      {required String icon,
      required String title,
      required String discription}) {
    return Container(
      width: 225,
      // color: Colors.red,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: // Colors.amber,
                Color(0xFFD9D9D9),
            child: Image.asset(
              icon,
              //width: 1000,

              //scale: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            softWrap: true,
            maxLines: 5,
            discription,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget wellnessEcosystemUpperSection(
      {required context, required currentScreen}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 30,
          color: mainThemeColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 230),
            child: Row(
              children: [
                Text(
                  "Home".toUpperCase(),
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 13,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Wellness Ecosystem".toUpperCase(),
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _joinTheBest(context),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Container _joinTheBest(context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 153,
      color: Color(0xFF2f80dc),
      child: UnconstrainedBox(
        child: SizedBox(
          width: (MediaQuery.of(context).size.width) * 0.7,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("assets/images/MyGalf_wellness1.png"),
              // child: Image.asset("assets/images/MyGalf_wellness.png"),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) * 0.4,
              // color: Colors.amber,
              child: Column(children: [
                Text(
                  "Join the best Holistic Wellness Programs for Corporates",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Scientifically Designed bu our Specialists using Survey Outcomes",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Click Here"),
                ),
              ]),
            ),
            CircleAvatar(
              radius: 55,
              // child: Image.asset(""),
              backgroundImage: AssetImage("assets/images/MyGalf_wellness2.png"),
            ),
          ]),
        ),
      ),
    );
  }
}
