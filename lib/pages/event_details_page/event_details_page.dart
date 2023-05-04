import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:my_galf/pages/event_details_page/events_details_controller.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  var eventDetailsController = Get.find<EventDetailsController>();
  final id = Get.parameters["id"];
  String dateFormater(date) {
    var dateArr = date.split("-").map((e) {
      return int.parse(e);
    }).toList();

    String formattedDate = DateFormat.yMMMEd()
        .format(DateTime(dateArr[0], dateArr[1], dateArr[2]));
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    eventDetailsController.fetchProducts(id);
  }

  @override
  Widget build(BuildContext context) {
    // print(eventDetailsController.eventData);
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 600
            ? "small"
            : currentWidth >= 600 && currentWidth <= 1200
                ? "medium"
                : "big";

    return Scaffold(
        body: Obx(() => eventDetailsController.isLoading == true
            ? myLoader
            : ListView(
                children: [
                  Navbar(currentScreen: currentScreen, selected: 'event'),
                  currentRoute(context: context),
                  Container(
                    child: eventDetails(context: context),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    child: eventDescription(context: context),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  imageDetails(context: context),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 231, 231, 229),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Similar Events",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 32,
                          height: 2,
                          child: Divider(
                            color: Color.fromARGB(255, 119, 113, 113),
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        upcomingEvents(
                            context: context, currentScreen: currentScreen),
                      ],
                    ),
                  )
                ],
              )));
  }

  Widget eventDetails({required context}) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 0.1,
              color: Color.fromARGB(255, 179, 179, 179),
            )
          ]),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.only(
                  left: 30, right: 15, bottom: 15, top: 25),
              //color: Colors.amber,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${eventDetailsController.eventData[0].title} ${eventDetailsController.eventData[0].id}",
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.access_time_outlined,
                        color: Color.fromARGB(255, 128, 40, 69),
                        size: 25.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      Text(" Date and Time",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 185, 183, 180))),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      dateFormater(
                          eventDetailsController.eventData[0].eventDate),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 12, 12, 11))),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color.fromARGB(255, 128, 40, 69),
                        size: 27.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      Text("Location",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 185, 183, 180))),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(eventDetailsController.eventData[0].venue,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 15, 15, 14))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Share With Friends",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 185, 183, 180))),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/facebook.png", width: 18),
                      const SizedBox(
                        width: 3,
                      ),
                      Image.asset(
                        "assets/images/email_b.png",
                        width: 19,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset("assets/icons/twitter-sign.png"),
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset("assets/images/instagram_b.png"),
                    ],
                  )
                ],
              )),
          Column(
            children: [
              const Dash(
                  direction: Axis.vertical,
                  length: 140,
                  dashLength: 12,
                  dashColor: Color.fromARGB(255, 184, 177, 177)),
              Container(
                padding: const EdgeInsets.only(top: 22),
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 221, 219, 219),
                    shape: BoxShape.circle),
                child: const Text(
                  "OR",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const Dash(
                  direction: Axis.vertical,
                  length: 140,
                  dashLength: 12,
                  dashColor: Color.fromARGB(255, 184, 177, 177)),
            ],
          ),
          SizedBox(
            //  color: Colors.amber,
            width: MediaQuery.of(context).size.width * 0.26,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: const Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 231, 18, 3),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Joining fee", style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                Text("₹ ${eventDetailsController.eventData[0].amount}",
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 32, 85, 128)),
                      onPressed: () {},
                      child: Text(
                        "Join Now",
                        style: GoogleFonts.rubik(textStyle: const TextStyle()),
                      )),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // print("You pressed Icon Elevated Button");
                    },
                    icon: const Icon(
                        Icons.arrow_downward), //icon data for elevated button
                    label: const Text("Download"), //label text
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget eventDescription({required context}) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.43,
            child: Column(
              children: [
                Text(
                  eventDetailsController.eventData[0].description,
                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                  style: const TextStyle(fontSize: 19, height: 1.5),
                ),
                const SizedBox(
                  height: 18,
                ),
                // const Text(
                //     "scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",
                //     style: TextStyle(fontSize: 19, height: 1.5)),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 26, right: 26, top: 26, bottom: 26),
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 114, 114, 112))),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(eventDetailsController
                              .eventData[0].eventOrganizerImage),

                          // NetworkImage(eventDetailsController
                          //     .eventData[0]?.user),
                          radius: 40,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Event Organizer",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Color.fromARGB(255, 180, 180, 175))),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                eventDetailsController
                                    .eventData[0].eventOrganizerName,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        /* const Icon(
                    Icons.share_outlined,
                    size: 35.0,
                    ),*/
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Phone Number",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 180, 180, 175))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            eventDetailsController
                                .eventData[0].eventOrganizerMobileNo
                                .toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 180, 180, 175))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            eventDetailsController
                                .eventData[0].eventOrganizerEmail,
                            style: const TextStyle(
                              fontSize: 16,
                            ))
                      ],
                    )
                  ],
                ),
                const Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.share_outlined,
                      size: 35.0,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget upcomingEvents({required context, required currentScreen}) {
    // print("object-----------$context");
    return UnconstrainedBox(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      // color: Colors.blue,
      height: 350,
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      eventDetailsController.eventData[0].reletedEvents.length,
                  itemBuilder: (context, index) {
                    return eventsCard(
                        context: context,
                        currentScreen: currentScreen,
                        index: index,
                        data: eventDetailsController
                            .eventData[0].reletedEvents[index]);
                    //  return Text("12345");
                  })),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  Widget eventsCard(
      {required context,
      required currentScreen,
      required index,
      required data}) {
    // const List dataa = [
    //   {"image": "assets/images/event2.jpg"},
    //   {"image": "assets/images/events_card1.jpg"},
    //   {"image": "assets/images/event1.jpg"},
    //   {"image": "assets/images/event2.jpg"},
    //   {"image": "assets/images/events_card1.jpg"},
    //   {"image": "assets/images/event4.jpg"},
    // ];
    return Container(
      color: const Color.fromARGB(255, 231, 231, 229),
      child: InkWell(
        onTap: () {
          //   parameters: {"id": "${eventData[index].id}"},

          eventDetailsController.fetchProducts(data["id"]);
          Get.toNamed(
            "/event-details/${data["id"]}",
            // parameters: {"id": "${data["id"]}"},
          );
        },
        child: Card(
            child: Container(
                width: 265,
                // height: 300,

                padding: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(children: [
                  Column(children: [
                    Container(
                      height: currentScreen == "big"
                          ? 180
                          : currentScreen == "small"
                              ? 125
                              : 180,
                      // color: Colors.red,

                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(data["banner"]))),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("SEP ",
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 214, 126, 230),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Text("18",
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text("${data["title"]}",
                                    // maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.rubik(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("${data["description"]}",
                                    maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.rubik(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Color.fromARGB(66, 8, 8, 8)),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Positioned(
                      top: 20,
                      left: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "FREE",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      )),
                  const Positioned(
                      top: 20,
                      right: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.download),
                      )),
                  const Positioned(
                      top: 20,
                      right: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )),
                ]))),
      ),
    );
  }

  Widget currentRoute({required context}) {
    return Column(
      children: [
        Container(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
            width: MediaQuery.of(context).size.width,
            height: 60,
            //  color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(
                  width: 150,
                ),
                Text(
                  "HOME / Events / Join Tech Startup Conference ",
                  style: TextStyle(color: Colors.black),
                )
              ],
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 20,
          // color: Colors.white,
        )
      ],
    );
  }

  Widget imageDetails({required context}) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),

      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              //  color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.41,
              height: 400,
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/img1.jpg")))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // color: Colors.blue,
                width: MediaQuery.of(context).size.width * 0.36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: 190,
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/img2.jpg")))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: 190,
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/img3.jpg"))))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.36,
                  height: 190,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/img4.jpg"))))
            ],
          )
        ],
      ),
    );
  }
}
