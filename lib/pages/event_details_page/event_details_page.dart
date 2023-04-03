import 'package:flutter/material.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:google_fonts/google_fonts.dart';


class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
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
        body: ListView(
      children: [
        Navbar(currentScreen: currentScreen),
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
          color: Color.fromARGB(255, 231, 231, 229),
         width: MediaQuery.of(context).size.width,
          child: Column(
            children:  [
              const SizedBox(
          height: 50,
        ),
              Text("Similar Events",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),

              SizedBox(
                width: 32,
                child: Expanded(
                  
                      child: Divider(
                        color: Color.fromARGB(255, 119, 113, 113),
                        height: 20,
                      ),
                ),
              ),
              const SizedBox(
                     height: 50,
              ),
               UpcomingEvents(context: context, currentScreen: currentScreen),
            ],
          ),
        )
      ],
    ));
  }
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
        Container(
          //color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
            children: [
              Container(
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
              SizedBox(
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
          ),
        )
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
            children: const [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                style: TextStyle(fontSize: 19,height:1.5),
              
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                  "scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",
                  style: TextStyle(fontSize: 19,height:1.5)),
            ],
          ),
        ),


        Container(
          padding: const EdgeInsets.only(left: 26, right: 26, top: 26,bottom:  26),
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 114, 114, 112))),
          child:Stack(
            children: [
              Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/about_advisor_1.jpg'),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Event Organizer",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 180, 180, 175))),
                                  SizedBox(height: 5,),
                          Text("Rohan Roy",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ],
                      ),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Phone Number",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 180, 180, 175))),

                             SizedBox(height: 5,),
                    Text("(415) 9988-876800",
                        style: TextStyle(
                          fontSize: 16,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Email",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 180, 180, 175))),
                             SizedBox(height: 5,),
                    Text("rohan@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                        ))
                  ],
                ),
              )
            ],
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Icon(
                      Icons.share_outlined,
                      size: 35.0,
                    ))
            ],
          ) ,
        )
      ],
    ),
  );
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
            padding: const EdgeInsets.only(left: 30, right: 15, bottom: 15,top: 25),
            //color: Colors.amber,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Join Tech Startup Conference",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
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
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Sunday, Feb 23 2023",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 12, 12, 11))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
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
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Skyscraper in Dubai, United Arab Emirates",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 15, 15, 14))),
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
                Container(
                  child: Row(
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
                  ),
                )
              ],
            )),
        Container(

          child:Column(
            children: [
               Dash(
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
                   Dash(
  direction: Axis.vertical,
  length: 140,
  dashLength: 12,
  dashColor: Color.fromARGB(255, 184, 177, 177)),
            ],
          ),
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
  child: Icon(
    Icons.favorite,
    color: Color.fromARGB(255, 231, 18, 3),
  ),
),
              ),
              const SizedBox(height: 10),
              Container(
                child:
                    const Text("Joining fee", style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 10),
              Container(
                child: const Text("₹ 1500",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 32, 85, 128)),
                    onPressed: () {},
                    child:  Text("Join Now",style: GoogleFonts.rubik(textStyle: TextStyle()),)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.2,
                child: OutlinedButton.icon(
                  onPressed: () {
                    print("You pressed Icon Elevated Button");
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
Widget UpcomingEvents({required context, required currentScreen}) {
  // print("object-----------$context");
  return UnconstrainedBox(
      child: SizedBox(
    width: MediaQuery.of(context).size.width * 0.8,
    // color: Colors.blue,
    // height: 500,
    child: Column(
      children: [
        
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return EventsCard(
                      context: context,
                      currentScreen: currentScreen,
                      index: index);
                    //  return Text("12345");
                })

           
            ),
        const SizedBox(
          height: 10,
        ),
        
      ],
    ),
  ));
}

Widget EventsCard({required context, required currentScreen, required index}) {
  const List data = [
    {"image": "assets/images/event2.jpg"},
    {"image": "assets/images/events_card1.jpg"},
    {"image": "assets/images/event1.jpg"},
    {"image": "assets/images/event2.jpg"},
    {"image": "assets/images/events_card1.jpg"},
    {"image": "assets/images/event4.jpg"},
  ];
  return Container(
  color:  Color.fromARGB(255, 231, 231, 229),
  child: Card(
      child: Container(
        
        width: 265,
        // height: 300,
       
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(20)
          ),
         child: Stack(
            children: [
              Column(
                children: [
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
                              image: AssetImage(data[index]["image"]))),
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
                                      color: Color.fromARGB(255, 214, 126, 230),
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
                              Text("Lorem ipsum dolor sit amet",
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
                              Text(
                                  "Lorem ipsum dolor sit amet,consectetur \n adipiscing elit,ula cursus",
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
                ]
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
            ])
      )
  ),
  );
}

Widget currentRoute({required context}) {
  return Column(
    children: [
      Container(
         padding: EdgeInsets.only(right:  MediaQuery.of(context).size.width * 0.1),
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
                "HOME / Events / Join Tech Startup Conference",
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 20,
       // color: Colors.white,
      )
    ],
  );
}
