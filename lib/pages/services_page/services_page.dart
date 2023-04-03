import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:my_galf/pages/services_page/service_page_controller.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final xController = Get.put(ServicePageController());

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
      body: Obx(
        () => SizedBox(
          width: double.infinity,
          child: ListView(
            children: [
              //navbar is component
              Navbar(currentScreen: currentScreen),
              productHeroCarousel(
                context: context,
                scrollController: xController.scrollController,
                isCategory: xController.isCategory,
                typeHandler: xController.typeHandler,
              ),
              const SizedBox(
                height: 20,
              ),
              ProductFilter(context: context),
              productList(
                updateLocation: xController.updateLocation,
                myProducts: xController.myProducts,
                currenIndex: xController.currenIndex.value,
              ),
              Footer(
                context: context,
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox serviceTypes({required String serviceName}) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(4.0),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.grey.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Text(
                  serviceName,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                  weight: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget productHeroCarousel(
    {required context,
    required scrollController,
    required isCategory,
    required typeHandler}) {
  return Container(
    height: 310,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      // color: Colors.blue,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          "assets/images/services_hero.png",
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Panelist",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus, mauris a aliquet\ncongue, elit quam ultrices odio, quis fermentum odio augue ac tellus.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                scrollController.animateTo(
                  scrollController.offset - 300.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            //List of panelist images
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.72,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 17,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed("/panelist");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage(
                                "assets/images/services_panelist.png",
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Panelist",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                scrollController.animateTo(
                  scrollController.offset + 300.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget productList({
  required updateLocation,
  required myProducts,
  required currenIndex,
}) {
  return Container(
    padding: const EdgeInsets.all(25),
    margin: const EdgeInsets.only(left: 25, right: 25),

    // color: Colors.amber,
    child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //maxCrossAxisExtent: 200,
          //childAspectRatio: 1,
          crossAxisSpacing: 20,
          crossAxisCount: 4,
          childAspectRatio: 2 / 2.5,
          mainAxisSpacing: 50,
        ),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: currenIndex == index
                ? const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  )
                : null,
            alignment: Alignment.center,
            child: productCard(
              myProducts: myProducts,
              index: index,
              updateLocation: updateLocation,
              currenIndex: currenIndex,
            ),
          );
        }),
  );
}

Widget productCard(
    {required myProducts,
    required index,
    required updateLocation,
    required currenIndex}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (event) {
      //print(event);
      final xController = Get.find<ServicePageController>();
      xController.updateLocation(index);
    },
    onExit: (event) {
      final xController = Get.find<ServicePageController>();
      xController.updateLocation(-1);
    },
    child: Container(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      //width: 287,
      //  height: 467,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              Get.toNamed("/service-details");
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                myProducts[index]['image'],
              ))),
            ),
          )),
          Text(
            myProducts[index]['title'].toString().toUpperCase(),
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(
                  0xFF1C4A64,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const SizedBox(
            width: 250,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              maxLines: 2,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1C4A64)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "2.75",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              const SizedBox(
                width: 5,
              ),
              RatingBarIndicator(
                rating: 2.75,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 14,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("₹1250",
                  style: TextStyle(
                      color: Color(0xFF1C4A64),
                      fontWeight: FontWeight.w500,
                      fontSize: 25)),
              SizedBox(
                width: 5,
              ),
              Text(
                "₹2,499",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xFF1C4A64),
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              ),
              Text(
                "(50% Off)",
                style: TextStyle(
                    color: Color(0xFF28C969),
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              ),
            ],
          ),
          currenIndex == index
              ? Container(
                  padding: const EdgeInsets.only(top: 3, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: const Color(0xFFFF9900),
                                  //  shape: const RoundedRectangleBorder(),
                                  minimumSize: const Size(180, 50)

                                  //onPrimary: Colors.black,
                                  ),
                              onPressed: () {
                                Get.snackbar("Added", "Item Added Successfully",
                                    backgroundColor: Colors.green);
                              },
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 13.0,
                              ),
                              label: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ))),
                      const Expanded(
                        child: Icon(Icons.favorite_border,
                            size: 24, color: Colors.black),
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  );
}

Widget ProductFilter({required context}) {
  return UnconstrainedBox(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Text("Service By",
              style: GoogleFonts.rubik(
                textStyle:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
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
                      "Sports",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    items: const [
                      DropdownMenuItem(value: "data", child: Text("Cricket")),
                      DropdownMenuItem(value: "data2", child: Text("Football")),
                      DropdownMenuItem(value: "data1", child: Text("Other")),
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
                      "Online",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    items: const [
                      DropdownMenuItem(value: "data", child: Text("Online 1")),
                      DropdownMenuItem(value: "data1", child: Text("Online 2")),
                      DropdownMenuItem(value: "data2", child: Text("Online 3")),
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
                      "Type",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    items: const [
                      DropdownMenuItem(value: "data", child: Text("Type 1")),
                      DropdownMenuItem(value: "data1", child: Text("Type 2")),
                      DropdownMenuItem(value: "data2", child: Text("Type 3")),
                    ],
                    onChanged: (value) {}),
              ),
            ],
          )),
        ],
      ),
    ),
  );
}
