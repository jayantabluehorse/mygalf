import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/event_details_page/events_details_controller.dart';
import 'package:my_galf/pages/events_page/events_controller.dart';
import 'package:intl/intl.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key});
  List dateFormater(date) {
    var dateArr = date.split("-").map((e) {
      return int.parse(e);
    }).toList();
    String formattedDate = DateFormat.yMMMEd()
        .format(DateTime(dateArr[0], dateArr[1], dateArr[2]));
    return formattedDate.split(" ");
  }

  var eventController = Get.find<EventController>();
  var eventDetailsController = Get.find<EventDetailsController>();
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
    return Title(
      color: Colors.grey,
      title: "evvv",
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 115,
            flexibleSpace:
                Navbar(currentScreen: currentScreen, selected: 'event'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: [
                // Navbar(currentScreen: currentScreen),

                // Eventhero(context: context, currentScreen: currentScreen),
                const SizedBox(
                  height: 90,
                ),
                upcomingEvents(
                    context: context,
                    currentScreen: currentScreen,
                    eventDetailsController: eventDetailsController),
                Footer(context: context)
              ],
            ),
          )),
    );
  }

  Widget upcomingEvents(
      {required context,
      required currentScreen,
      required eventDetailsController}) {
    // print("object-----------$context");
    return UnconstrainedBox(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      // color: Colors.blue,
      // height: 500,
      child: Column(
        children: [
          Row(
            children: [
              Text("Up coming Event",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                        icon: const Icon(Icons.expand_more),
                        underline: const Text(""),
                        hint: const Text(
                          "Weekdays",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        items: const [
                          DropdownMenuItem(value: "data", child: Text("data")),
                          DropdownMenuItem(value: "data1", child: Text("data")),
                          DropdownMenuItem(value: "data2", child: Text("data")),
                        ],
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                        icon: const Icon(Icons.expand_more),
                        underline: const Text(""),
                        hint: const Text(
                          "Event Type",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        items: const [
                          DropdownMenuItem(value: "data", child: Text("data")),
                          DropdownMenuItem(value: "data1", child: Text("data")),
                          DropdownMenuItem(value: "data2", child: Text("data")),
                        ],
                        onChanged: (value) {}),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                        icon: const Icon(Icons.expand_more),
                        underline: const Text(""),
                        hint: const Text(
                          "Any Category",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        items: const [
                          DropdownMenuItem(value: "data", child: Text("data")),
                          DropdownMenuItem(value: "data1", child: Text("data")),
                          DropdownMenuItem(value: "data2", child: Text("data")),
                        ],
                        onChanged: (value) {}),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => eventController.isLoading == true
                ? myLoader
                : eventController.eventList.isEmpty
                    ? myemptyDataView(context: context)
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    //maxCrossAxisExtent: 200,
                                    //childAspectRatio: 1,

                                    crossAxisSpacing: 20,
                                    crossAxisCount: currentScreen == "big"
                                        ? 3
                                        : currentScreen == "medium"
                                            ? 2
                                            : 1,
                                    childAspectRatio: 1 / 1,
                                    mainAxisSpacing: 20),
                            itemCount: eventController.eventList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return eventsCard(
                                  context: context,
                                  currentScreen: currentScreen,
                                  eventData: eventController.eventList,
                                  index: index,
                                  eventDetailsController:
                                      eventDetailsController,
                                  dateFormater: dateFormater);
                            })),
          ),
          const SizedBox(
            height: 10,
          ),
          // eventController.eventList.isNotEmpty
          //     ? SizedBox(
          //         height: 50,
          //         child: ElevatedButton(
          //             onPressed: () {},
          //             style: ElevatedButton.styleFrom(
          //                 backgroundColor:
          //                     const Color.fromARGB(255, 235, 235, 235)),
          //             child: const Text(
          //               "Load More Event",
          //               style: TextStyle(color: Colors.black),
          //             )),
          //       )
          //     : const SizedBox(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}

// -------------------------
// Widget Eventhero({required context, required currentScreen}) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: currentScreen == "big"
//         ? 330
//         : currentScreen == "medium"
//             ? 250
//             : 200,
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage("assets/images/events_hero.jpg"))),
//   );
// }

Widget eventhero({required context, required currentScreen}) {
  return Stack(
    children: [
      ClipPath(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: currentScreen == "big"
              ? 330
              : currentScreen == "medium"
                  ? 250
                  : 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/ecosystem_banner.jpg"),
            ),
          ),
        ),
      ),
      const Positioned(
        left: 130,
        top: 100,
        child: Text(
          "Events",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        //
      ),
      const Positioned(
        left: 100,
        top: 130,
        child: Text(
          "Home/ALL events",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ],
  );
}

Widget eventsCard(
    {required context,
    required currentScreen,
    required index,
    required eventData,
    required eventDetailsController,
    required dateFormater}) {
  return InkWell(
    onTap: () {
      Get.toNamed(
        "/event-details/${eventData[index].id}",
      );
    },
    child: Container(
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(

          // color: Colors.red,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(eventData[index].banner
                          // "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80"

                          ))),
              child: Stack(
                children: [
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                                dateFormater(eventData[index].eventDate)[1]
                                    .toString(),
                                style: GoogleFonts.rubik(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 214, 126, 230),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(eventData[index].title,
                                  // maxLines: 2,
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                                int.parse(dateFormater(
                                                eventData[index].eventDate)[2]
                                            .split(",")[0]) <
                                        10
                                    ? "0${dateFormater(eventData[index].eventDate)[2].split(",")[0]}"
                                    : dateFormater(
                                            eventData[index].eventDate)[2]
                                        .split(",")[0]
                                        .toString(),
                                style: GoogleFonts.rubik(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(eventData[index].description,
                                  maxLines: 2,
                                  softWrap: true,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color.fromARGB(66, 8, 8, 8)),
                                  )),
                            )
                          ],
                        ))

                        // const SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),

    // color: Colors.red,
  );
}
  // Positioned(
  //             top: 20,
  //             left: 20,
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.white,
  //                   shape: const StadiumBorder()),
  //               child: const Text(
  //                 "FREE",
  //                 style: TextStyle(
  //                     color: Colors.black, fontWeight: FontWeight.bold),
  //               ),
  //               onPressed: () {},
  //             )),
  //         const Positioned(
  //             top: 20,
  //             right: 80,
  //             child: CircleAvatar(
  //               backgroundColor: Colors.white,
  //               child: Icon(Icons.download),
  //             )),
  //         const Positioned(
  //             top: 20,
  //             right: 20,
  //             child: CircleAvatar(
  //               backgroundColor: Colors.white,
  //               child: Icon(
  //                 Icons.favorite,
  //                 color: Colors.red,
  //               ),
  //             )),