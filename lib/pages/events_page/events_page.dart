import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

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
        // appBar: AppBar(
        //     // title: Text("$currentWidth"),
        //     ),
        body: SizedBox(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          Navbar(currentScreen: currentScreen),
          // Eventhero(context: context, currentScreen: currentScreen),
          const SizedBox(
            height: 90,
          ),
          UpcomingEvents(context: context, currentScreen: currentScreen),
          Footer(context: context)
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

Widget Eventhero({required context, required currentScreen}) {
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

Widget UpcomingEvents({required context, required currentScreen}) {
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
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                itemCount: 6,
                itemBuilder: (BuildContext ctx, index) {
                  return EventsCard(
                      context: context,
                      currentScreen: currentScreen,
                      index: index);
                })

            //  GridView.count(
            //   shrinkWrap: true,
            //   childAspectRatio: 1 / 1,
            //   physics: const NeverScrollableScrollPhysics(),
            //   crossAxisCount: currentScreen == "big"
            //       ? 3
            //       : currentScreen == "medium"
            //           ? 2
            //           : 1,
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 30,
            //   // mainAxisSpacing: 2.0,/
            //   children: List.generate(12, (index) {
            //     return EventsCard(context: context, currentScreen: currentScreen);
            //   }),
            // ),
            ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 235, 235, 235)),
              child: const Text(
                "Load More Event",
                style: TextStyle(color: Colors.black),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  ));
}

Widget EventsCard({required context, required currentScreen, required index}) {
  const List data = [
    // {"image": "assets/images/running.jpg"},
    {"image": "assets/images/event2.jpg"},
    {"image": "assets/images/events_card1.jpg"},
    {"image": "assets/images/event1.jpg"},
    {"image": "assets/images/event2.jpg"},
    {"image": "assets/images/events_card1.jpg"},
    // {"image": "assets/images/event3.jpg"},
    {"image": "assets/images/event4.jpg"},
  ];
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        Get.toNamed("/event-details");
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(

              // color: Colors.red,
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      height: currentScreen == "big"
                          ? 180
                          : currentScreen == "small"
                              ? 250
                              : 180,
                      // color: Colors.red,

                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(data[index]["image"]))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    // color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("SEP",
                                style: GoogleFonts.rubik(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 214, 126, 230),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("18",
                                style: GoogleFonts.rubik(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Lorem ipsum dolor sit amet",
                                  // maxLines: 2,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  "Lorem ipsum dolor sit amet,consectetur \n adipiscing elit,ula cursus",
                                  maxLines: 2,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.rubik(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color.fromARGB(66, 8, 8, 8)),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          // color: Colors.red,
        ),
      ),
    ),
  );
}
