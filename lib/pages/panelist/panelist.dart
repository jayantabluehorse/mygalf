import 'package:flutter/material.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/navbar.dart';

class Panelist extends StatefulWidget {
  const Panelist({Key? key}) : super(key: key);

  @override
  _PanelistState createState() => _PanelistState();
}

class _PanelistState extends State<Panelist> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 500
            ? "small"
            : currentWidth >= 500 && currentWidth <= 1100
                ? "medium"
                : "big";
    return Scaffold(
        body: Container(
            width: double.infinity,
            child: ListView(children: [
              //navbar is component
              Navbar(currentScreen: currentScreen),
              Container(
                  child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 199, 209, 201),
                radius: 110,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 199, 209, 201),
                  radius: 110,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile.jpg"), //NetworkImage
                    radius: 100,
                  ), //CircleAvatar
                ), //CircleAvatar
              )),
              SizedBox(
                height: 5,
              ),
              UnconstrainedBox(
                child: Container(
                    padding: EdgeInsets.all(3),
                    // width: MediaQuery.of(context).size.width * 0.8,
                    //color: Colors.black,
                    child: Text(
                      "PANELIST INFO",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
              ),
              UnconstrainedBox(
                child: Container(
                    width: 50,
                    margin: const EdgeInsets.only(left: 12.0, right: 20.0),
                    child: Divider(
                      color: Colors.red,
                      height: 24,
                    )),
              ),
              UnconstrainedBox(
                child: Container(

                    // width: MediaQuery.of(context).size.width * 0.8,
                    //color: Colors.black,
                    child: Text(
                  "Coach Girish Bindra",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textAlign: TextAlign.center,
                )),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/facebook.png"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/twitter.png"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/whatsapp.png"),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 200, right: 200),
                child: Text(
                  "Coach Girish is certified for 'Marathon Trainings' from AMERICAN COLLEGE OF SPORTS & MEDICINE. Having represented many coveted brands like Garmin and Asics as their coach; Girish has been instrumental in transforming 1000 of lives and many corporate clients through his structured and flexible run training programs.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(left: 200, right: 200),
                child: Text(
                  "Coach Girish is a celebrated runner and an inspiring story. He was diagnosed with Neurocysticercosis in year 2006 having blood clots in brain. Post his treatment he started running in 2008 and since then he has conquered numerous ultramarathons, marathons, half marathons and 10K both nationally and internationally.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                color: Color.fromARGB(255, 233, 233, 228),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "SERVICES",
                      style: TextStyle(fontSize: 27),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            servicesCaed(context),
                            servicesCaed(context),
                            servicesCaed(context),
                            servicesCaed(context)
                          ]),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 233, 233, 228),
                            minimumSize: Size(150, 75),
                            side: BorderSide(
                              color: Color.fromARGB(255, 5, 54, 94),
                            )),
                        onPressed: () {},
                        child: Text('View all',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 5, 54, 94),
                                fontWeight: FontWeight.w700))),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              SizedBox(
              height: 50,),
              UnconstrainedBox(
                child: Container(
                    padding: EdgeInsets.all(3),
                    // width: MediaQuery.of(context).size.width * 0.8,
                    //color: Colors.black,
                    child: Text(
                      "Videos",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
              ),
              UnconstrainedBox(
                child: Container(
                    width: 50,
                    margin: const EdgeInsets.only(left: 12.0, right: 20.0),
                    child: Divider(
                      color: Colors.red,
                      height: 24,
                    )),
              ),
              UnconstrainedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      videosCard(),
                       videosCard(),
                        videosCard(),
                         videosCard(),
                    ],
                  ),
                ),
              )
            ])));
  }
}

Widget videosCard(){
  return Container(
    width: 262,
    child: Image.asset('assets/images/video.jpeg'),
  );

}

Widget servicesCaed(context) {
  return Container(
    width: 262,
    padding: EdgeInsets.only(top: 23, bottom: 23, left: 14, right: 14),
    color: Colors.white,
    child: Column(
      children: [
        Container(
          height: 190,
          width: 252,

          // width: MediaQuery.of(context).size.width,
          // color: Colors.blue,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/img-1.jpg"))),
        ),
        Text(
          "Cross Fitness Power Package",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            children: [
              Text(
                "Rs. 10000 ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Rs. 3000 ",
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 144, 150, 144)),
              ),
              Text(
                " 70% off",
                style: TextStyle(fontSize: 12, color: Colors.green),
              )
            ],
          ),
        )
      ],
    ),
  );
}
