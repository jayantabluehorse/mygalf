import 'package:flutter/material.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Panelist extends StatefulWidget {
  const Panelist({Key? key}) : super(key: key);

  @override
  _PanelistState createState() => _PanelistState();
}

class _PanelistState extends State<Panelist> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getPanelistData();
  }

  List<PanelistModel> panalistList = [];
  List<ServicesListModel> serviceList = [];
  Future<List<PanelistModel>> getPanelistData() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('https://mygalf.tezcommerce.com/api/v1/panelist/view');
    Map data1 = {
      "storeId": 1,
      "id": "${Get.parameters['id']}",
    };
    var body = json.encode(data1);
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU"
        },
        body: body);

    print("${response.statusCode}");

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(data['details']);
      setState(() {
        PanelistModel panelistModel = PanelistModel(
            name: data['details']['name'], id: data['details']['id']);
        panalistList.add(panelistModel);
        print("===================123454321=========================");
        print("${data['details']}");
        for (Map i in data['details']['relatedServiceArr']) {
          ServicesListModel servicesListModel = ServicesListModel(
              name: i['name'],
              image: i['image'],
              description: i['description'],
              price: i['price'],
              shortDescription: i['shortDescription'],
              id: i['id']);
          serviceList.add(servicesListModel);
        }

        isLoading = false;
      });

      /* setState(() {
        for (Map i in data['details']['relatedServiceArr']) {
          ServicesListModel servicesListModel = ServicesListModel(
              name: i['name'],
              image: i['image'],
              description: i['description'],
              price: i['price'],
              shortDescription: i['shortDescription'],
              id: i['id']);
          serviceList.add(servicesListModel);
        }
      });

      print(serviceList);*/
      return panalistList;
    } else {
      return panalistList;
    }
  }

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
        body: SizedBox(
            width: double.infinity,
            child: ListView(children: [
              //navbar is component
              Navbar(currentScreen: currentScreen, selected: 'panelList'),
              const CircleAvatar(
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
              ),
              const SizedBox(
                height: 5,
              ),
              UnconstrainedBox(
                child: Container(
                    padding: const EdgeInsets.all(3),
                    // width: MediaQuery.of(context).size.width * 0.8,
                    //color: Colors.black,
                    child: const Text(
                      "PANELIST INFO",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
              ),
              UnconstrainedBox(
                child: Container(
                    width: 50,
                    margin: const EdgeInsets.only(left: 12.0, right: 20.0),
                    child: const Divider(
                      color: Colors.red,
                      height: 24,
                    )),
              ),
              isLoading
                  ? const Text("")
                  : panalistList.isEmpty
                      ? const Text("Loading")
                      : UnconstrainedBox(
                          child: Text(
                            panalistList[0].name.toString(),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
              Row(
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

              Container(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: const Text(
                  "Coach Girish is certified for 'Marathon Trainings' from AMERICAN COLLEGE OF SPORTS & MEDICINE. Having represented many coveted brands like Garmin and Asics as their coach; Girish has been instrumental in transforming 1000 of lives and many corporate clients through his structured and flexible run training programs.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: const Text(
                  "Coach Girish is a celebrated runner and an inspiring story. He was diagnosed with Neurocysticercosis in year 2006 having blood clots in brain. Post his treatment he started running in 2008 and since then he has conquered numerous ultramarathons, marathons, half marathons and 10K both nationally and internationally.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                color: const Color.fromARGB(255, 233, 233, 228),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "SERVICES",
                      style: TextStyle(fontSize: 27),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    /*  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            servicesCard(context),
                            servicesCard(context),
                            servicesCard(context),
                            servicesCard(context)
                          ]),
                    ),*/
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return servicesCard(context);
                          }),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 233, 233, 228),
                            minimumSize: const Size(150, 75),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 5, 54, 94),
                            )),
                        onPressed: () {},
                        child: const Text('View all',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 5, 54, 94),
                                fontWeight: FontWeight.w700))),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              UnconstrainedBox(
                child: Container(
                    padding: const EdgeInsets.all(3),
                    // width: MediaQuery.of(context).size.width * 0.8,
                    //color: Colors.black,
                    child: const Text(
                      "Videos",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
              ),
              UnconstrainedBox(
                child: Container(
                    width: 50,
                    margin: const EdgeInsets.only(left: 12.0, right: 20.0),
                    child: const Divider(
                      color: Colors.red,
                      height: 24,
                    )),
              ),
              UnconstrainedBox(
                child: SizedBox(
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

Widget videosCard() {
  return SizedBox(
    width: 262,
    child: Image.asset('assets/images/video.jpeg'),
  );
}

Widget servicesCard(context) {
  return Container(
    width: 262,
    margin: const EdgeInsets.only(right: 20),
    padding: const EdgeInsets.only(top: 23, bottom: 23, left: 14, right: 14),
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
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/img-1.jpg"))),
        ),
        const Text(
          "Cross Fitness Power Package",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
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
        )
      ],
    ),
  );
}

class PanelistModel {
  String name;
  int id;
  PanelistModel({required this.name, required this.id});
}

class ServicesListModel {
  String name, image, description, shortDescription;
  String price;
  int id;

  ServicesListModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.shortDescription,
      required this.id});
}
