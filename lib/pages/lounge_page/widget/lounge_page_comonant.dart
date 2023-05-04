import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoungePageComponent extends StatelessWidget {
  const LoungePageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: leftScrollMenu(context),
                ),
                Positioned(
                    right: 0,
                    top: 27,
                    child: rightStickyMenu(context, context)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget leftScrollMenu(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), //color of shadow
        // spreadRadius: 2, //spread radius
        // blurRadius: 7, // blur radius
        offset: const Offset(0, 2),
      )
    ]),
    width: (MediaQuery.of(context).size.width * 0.9) * 0.58,
    child: Column(
      children: [
        newsItems(
          context,
          imagePath: "assets/images/b1.jpg",
          title: "Resuming activity after COVID-19 illness",
        ),
        // const SizedBox(
        //   height: 25,
        // ),
        // newsItems(
        //   context,
        //   imagePath: "assets/images/b2.jpg",
        //   title: "World Running Day",
        // ),
        // const SizedBox(
        //   height: 25,
        // ),
        // newsItems(
        //   context,
        //   imagePath: "assets/images/news3.jpg",
        //   title: "Why NirvanaFitness",
        // ),
      ],
    ),
  );
}

Widget rightStickyMenu(BuildContext, context) {
  return SizedBox(
    width: (MediaQuery.of(context).size.width * 0.9) * 0.30,
    // color: Colors.green,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   alignment: Alignment.topLeft,
        //   width: (MediaQuery.of(context).size.width * 0.9) * 0.30,
        //   height: 43,
        //   decoration: const BoxDecoration(
        //       // border: Border(bottom: BorderSide(color: Colors.black, width: 3)),
        //       ),
        //   child: UnconstrainedBox(
        //     child: Container(
        //       decoration: const BoxDecoration(
        //         color: Colors.black,
        //       ),
        //       width: 150,
        //       height: 40,
        //       child: Center(
        //         child: Text(
        //           "SUBSCRIBE",
        //           style: GoogleFonts.rubik(
        //               textStyle: const TextStyle(color: Colors.white)),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        Container(
          padding: const EdgeInsets.all(2),
          width: (MediaQuery.of(context).size.width * 0.9) * 0.30,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              // border: Border.all(color: Colors.red)
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2),
                )
              ]),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  // color: Colors.red,
                  height: 40,
                  width:
                      ((MediaQuery.of(context).size.width * 0.9) * 0.30) * 0.55,
                  child: const TextField(
                    // textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 20, left: 10),
                        border: InputBorder.none,
                        hintStyle: TextStyle(),
                        hintText: "EMAIL ADDRESS"),
                  ),
                ),
              ),
              SizedBox(
                // color: Colors.red,
                width:
                    ((MediaQuery.of(context).size.width * 0.9) * 0.30) * 0.30,
                height: 40,
                child: InkWell(
                  onTap: () {},
                  child: storiesButtons(
                    text: "SUBSCRIBE",
                    leftPadding: 14,
                    rightPadding: 14,
                    backgroundColor: Colors.black,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),

        Container(
          alignment: Alignment.topLeft,
          width: (MediaQuery.of(context).size.width * 0.9) * 0.30,
          height: 43,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black, width: 3)),
          ),
          child: UnconstrainedBox(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              width: 150,
              height: 40,
              child: Center(
                child: Text(
                  "CATEGORY",
                  style: GoogleFonts.rubik(
                      textStyle: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,

            // border: Border.all(color: Colors.black)
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(onTap: () {}, child: channelNames(text: "workouts")),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {},
                  child: channelNames(text: "healthy diet and nutrition")),
              const SizedBox(
                height: 10,
              ),
              InkWell(onTap: () {}, child: channelNames(text: "triathlon")),
              const SizedBox(
                height: 10,
              ),
              InkWell(onTap: () {}, child: channelNames(text: "yoga")),
              const SizedBox(
                height: 10,
              ),
              InkWell(onTap: () {}, child: channelNames(text: "running")),
              const SizedBox(
                height: 10,
              ),
              InkWell(onTap: () {}, child: channelNames(text: "swimming")),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {},
                  child: channelNames(text: "counselling and therapy")),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {}, child: channelNames(text: "wellness products")),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {}, child: channelNames(text: "preventive health")),
              const SizedBox(
                height: 10,
              ),
              InkWell(onTap: () {}, child: channelNames(text: "cxo wellness")),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {}, child: channelNames(text: "wellness talks")),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {}, child: channelNames(text: "virtual events")),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.green,
                height: double.maxFinite,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget newsItems(
  BuildContext context, {
  String? imagePath,
  String? title,
  double? aspectRatio = 20 / 12,
}) {
  return SizedBox(
    width: (MediaQuery.of(context).size.width * 0.9) * 0.70,
    // color: Colors.blue,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        AspectRatio(
          aspectRatio: aspectRatio!,
          child: Image.asset(
            alignment: Alignment.centerLeft,
            imagePath ?? "",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: rubikText(
            text: title ?? "",
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            rubikText(
              text: "General Fitness",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              width: 15,
            ),
            rubikText(
              text: "By:",
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.grey,
            ),
            rubikText(
              text: "Vani Pahva",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            const SizedBox(
              width: 15,
            ),
            rubikText(
              text: "17 Apr 2021",
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 0.8,
          width: 60,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        rubikText(
          text:
              "Two general theories exist on the origins of yoga. The linear model holds that yoga originated in the Vedic period, as reflected in the Vedic textual corpus, and influenced Buddhism; ",
          fontSize: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        rubikText(
          text:
              "Two general theories exist on the origins of yoga. The linear model holds that yoga originated in the Vedic period, as reflected in the Vedic textual corpus, and influenced Buddhism; according to author Edward Fitzpatrick Crangle, this model is mainly supported by Hindu scholars. According to the synthesis model, yoga is a synthesis of non-Vedic and Vedic elements; this model is favoured in Western scholarship",
          fontSize: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Get.toNamed("/readmore");
        //   },
        //   style: ElevatedButton.styleFrom(
        //     minimumSize: const Size(
        //       150,
        //       60,
        //     ),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(0),
        //     ),
        //     backgroundColor: Colors.black,
        //   ),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       rubikText(
        //         text: "READ MORE ",
        //         fontSize: 15,
        //       ),
        //       const Icon(
        //         Icons.arrow_forward,
        //         size: 12,
        //       ),
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        // Container(
        //   height: 1,
        //   width: MediaQuery.of(context).size.width * 0.5,
        //   color: Colors.grey.withOpacity(0.2),
        // )
      ],
    ),
  );
}

SizedBox storiesButtons(
    {required String text,
    double? height = 20,
    double? leftPadding = 7.0,
    double? rightPadding = 7.0,
    Color? color,
    Color? backgroundColor,
    double? fontSize = 10}) {
  return SizedBox(
    height: height,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: leftPadding!,
          right: rightPadding!,
        ),
        child: Center(
          child: rubikText(
            text: text,
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    ),
  );
}

Text rubikText({
  required String text,
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
}) {
  return Text(text,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          // backgroundColor: Colors.black45,
        ),
      ));
}

Widget channelNames({required String text}) {
  return Row(
    children: [
      // Container(
      //     padding: const EdgeInsets.all(10),
      //     decoration: const BoxDecoration(
      //         border: Border(bottom: BorderSide(color: Colors.grey))),
      //     child: Text(">  ${text.toUpperCase()}")),
      // const SizedBox(
      //   width: 15,
      // ),
      Expanded(
        child: SizedBox(
          // Remove this width property or set it to null
          width: 50,
          child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 111, 111, 111)))),
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              // decoration:ElevatedButton
              child: Text(
                text.toUpperCase(),
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 111, 111, 111))),
              )),
        ),
      ),

      // storiesButtons(
      //   height: 20,
      //   text: "SUBSCRIBE",
      //   leftPadding: 14,
      //   rightPadding: 14,
      //   backgroundColor: Colors.black,
      //   color: Colors.white,
      //   fontSize: 10,
      // )
    ],
  );
}
