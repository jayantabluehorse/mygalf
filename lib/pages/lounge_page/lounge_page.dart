import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/constant.dart';
import 'package:my_galf/components/footer.dart';
import '../../components/navbar.dart';
import 'package:my_galf/pages/lounge_page/lounge_controller.dart';
import 'package:get/get.dart';

import '../../components/request_callback/request_callBack.dart';

//import '../../components/request_callback/requestCallBack.dart';

class LoungePage extends StatefulWidget {
  const LoungePage({super.key});

  @override
  State<LoungePage> createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage> {
  // late ScrollController _controller;

  // @override
  // void initState() {
  //   _controller = ScrollController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  final LoungeController _loungeController = Get.find<LoungeController>();
  final _popularTag = ScrollController();
  final _storiesSection = ScrollController();
  final _latestVideosSection = ScrollController();
  final _latestNewsSection = ScrollController();

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
      color: Colors.black,
      title: "event",
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Stack(
            children: [
              ListView(
                children: [
                  Navbar(currentScreen: currentScreen, selected: 'lounge'),
                  _loungeController.isLoading == true
                      ? const Text("loading....")
                      : _loungeController.loungeList.isEmpty
                          ? myemptyDataView(context: context)
                          : Text(
                              _loungeController.loungeList[0]["id"].toString()),
                  popularTagSection(),
                  UnconstrainedBox(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 25,
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       width: 50,
                      //       color: Colors.green,
                      //       child: InkWell(
                      //         onTap: () {
                      //           _popularTag.animateTo(
                      //             _popularTag.offset - 300.0,
                      //             duration: const Duration(milliseconds: 500),
                      //             curve: Curves.ease,
                      //           );
                      //         },
                      //         child: Container(
                      //           padding: const EdgeInsets.only(left: 6),
                      //           alignment: Alignment.center,
                      //           width: 40,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //               // color: Colors.red,
                      //               border: Border.all(color: Colors.black)),
                      //           child: const Icon(
                      //             Icons.arrow_back_ios,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 50,
                      //       color: Colors.red,
                      //       child: InkWell(
                      //         onTap: () {
                      //           // print("Soudip555555555555555555555");
                      //           _popularTag.animateTo(
                      //             _popularTag.offset + 300.0,
                      //             duration: const Duration(milliseconds: 500),
                      //             curve: Curves.ease,
                      //           );
                      //         },
                      //         child: Container(
                      //           padding: const EdgeInsets.only(left: 6),
                      //           alignment: Alignment.center,
                      //           width: 40,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //               // color: Colors.red,
                      //               border: Border.all(color: Colors.black)),
                      //           child: const Icon(
                      //             Icons.arrow_forward_ios,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  storiesSection(),
                  UnconstrainedBox(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 30,
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       width: 50,
                      //       color: Colors.green,
                      //       child: InkWell(
                      //         onTap: () {
                      //           _StoriesSection.animateTo(
                      //             _StoriesSection.offset - 300.0,
                      //             duration: const Duration(milliseconds: 500),
                      //             curve: Curves.ease,
                      //           );
                      //         },
                      //         child: Container(
                      //           padding: const EdgeInsets.only(left: 6),
                      //           alignment: Alignment.center,
                      //           width: 40,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //               // color: Colors.red,
                      //               border: Border.all(color: Colors.black)),
                      //           child: const Icon(
                      //             Icons.arrow_back_ios,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 50,
                      //       color: Colors.red,
                      //       child: InkWell(
                      //         onTap: () {
                      //           // print("Soudip555555555555555555555");
                      //           _StoriesSection.animateTo(
                      //             _StoriesSection.offset + 300.0,
                      //             duration: const Duration(milliseconds: 500),
                      //             curve: Curves.ease,
                      //           );
                      //         },
                      //         child: Container(
                      //           padding: const EdgeInsets.only(left: 6),
                      //           alignment: Alignment.center,
                      //           width: 40,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //               // color: Colors.red,
                      //               border: Border.all(color: Colors.black)),
                      //           child: const Icon(
                      //             Icons.arrow_forward_ios,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  latestVideosSection(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 30,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 30,
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       width: 50,
                        //       color: Colors.green,
                        //       child: InkWell(
                        //         onTap: () {
                        //           _LatestVideosSection.animateTo(
                        //             _LatestVideosSection.offset - 300.0,
                        //             duration: Duration(milliseconds: 500),
                        //             curve: Curves.ease,
                        //           );
                        //         },
                        //         child: Container(
                        //           padding: EdgeInsets.only(left: 6),
                        //           alignment: Alignment.center,
                        //           width: 40,
                        //           height: 40,
                        //           decoration: BoxDecoration(
                        //               // color: Colors.red,
                        //               border:
                        //                   Border.all(color: Colors.black)),
                        //           child: Icon(
                        //             Icons.arrow_back_ios,
                        //             color: Colors.black,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: 50,
                        //       color: Colors.red,
                        //       child: InkWell(
                        //         onTap: () {
                        //           // print("Soudip555555555555555555555");
                        //           _LatestVideosSection.animateTo(
                        //             _LatestVideosSection.offset + 300.0,
                        //             duration: Duration(milliseconds: 500),
                        //             curve: Curves.ease,
                        //           );
                        //         },
                        //         child: Container(
                        //           padding: EdgeInsets.only(left: 6),
                        //           alignment: Alignment.center,
                        //           width: 40,
                        //           height: 40,
                        //           decoration: BoxDecoration(
                        //               // color: Colors.red,
                        //               border:
                        //                   Border.all(color: Colors.black)),
                        //           child: Icon(
                        //             Icons.arrow_forward_ios,
                        //             color: Colors.black,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ),
                    ),
                  ),
                  latestNewsSection(),
                  UnconstrainedBox(
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.8,
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       width: 50,
                      //       color: Colors.green,
                      //       child: InkWell(
                      //         onTap: () {
                      //           _LatestNewsSection.animateTo(
                      //             _LatestNewsSection.offset - 300.0,
                      //             duration: Duration(milliseconds: 500),
                      //             curve: Curves.ease,
                      //           );
                      //         },
                      //         child: Container(
                      //           padding: EdgeInsets.only(left: 6),
                      //           alignment: Alignment.center,
                      //           width: 40,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //               // color: Colors.red,
                      //               border: Border.all(color: Colors.black)),
                      //           child: Icon(
                      //             Icons.arrow_back_ios,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       width: 50,
                      //       color: Colors.red,
                      //       child: InkWell(
                      //         onTap: () {
                      //           // print("Soudip555555555555555555555");
                      //           _LatestNewsSection.animateTo(
                      //             _LatestNewsSection.offset + 300.0,
                      //             duration: Duration(milliseconds: 500),
                      //             curve: Curves.ease,
                      //           );
                      //         },
                      //         child: Container(
                      //           padding: EdgeInsets.only(left: 6),
                      //           alignment: Alignment.center,
                      //           width: 40,
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //               // color: Colors.red,
                      //               border: Border.all(color: Colors.black)),
                      //           child: Icon(
                      //             Icons.arrow_forward_ios,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  extraSection(),
                  // Stack(
                  //   children: [
                  //     StickyHeader(
                  //         header: rightStickyMenu(), content: leftScrollMenu())
                  //   ],
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Footer(context: context)
                ],
              ),
              RequestCallback(),
            ],
          ),
        ),
      ),
    );
  }

  Widget extraSection() {
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
                  child: leftScrollMenu(),
                ),
                Positioned(right: 0, top: 27, child: rightStickyMenu()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget leftScrollMenu() {
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
          const SizedBox(
            height: 25,
          ),
          newsItems(
            context,
            imagePath: "assets/images/b2.jpg",
            title: "World Running Day",
          ),
          const SizedBox(
            height: 25,
          ),
          newsItems(
            context,
            imagePath: "assets/images/news3.jpg",
            title: "Why NirvanaFitness",
          ),
        ],
      ),
    );
  }

  Widget rightStickyMenu() {
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
                    width: ((MediaQuery.of(context).size.width * 0.9) * 0.30) *
                        0.55,
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
          const SizedBox(
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
                    onTap: () {},
                    child: channelNames(text: "wellness products")),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: channelNames(text: "preventive health")),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {}, child: channelNames(text: "cxo wellness")),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget latestNewsSection() {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.8,
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rubikText(
              text: "Latest News",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 10,
            ),
            latestNewsList(),
          ],
        ),
      ),
    );
  }

  Widget latestVideosSection() {
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        // color: Colors.red,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rubikText(
              text: "Latest Videos",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 10,
            ),
            videosList(),
          ],
        ),
      ),
    );
  }

  Widget storiesSection() {
    return UnconstrainedBox(
      child: UnconstrainedBox(
        child: SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rubikText(
                text: "Get started with our best stories",
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              storiesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget popularTagSection() {
    return UnconstrainedBox(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(4),
        // color: Colors.amber,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              rubikText(
                text: "Popular Tags".toUpperCase(),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              // ),
              const SizedBox(
                height: 5,
              ),
              popularTagsList(),
            ]),
      ),
    );
  }

  Widget videosList() {
    List videoData = [
      {
        "image": "https://i.postimg.cc/hty1TK5y/boating.webp",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Boat yoga is a yoga pose that is also known as Navasana or Naukasana.",
      },
      {
        "image": "https://i.postimg.cc/k5SRG93t/yoga.jpg",
        //"https://hips.hearstapps.com/hmg-prod/images/woman-running-against-wall-royalty-free-image-930134532-1552999674.jpg?crop=0.667xw:1.00xh;0.286xw,0&resize=1200:*",
        "title":
            "Yoga is a holistic practice that originated in ancient India and has been practiced for thousands of years.",
      },
      {
        "image": "https://i.postimg.cc/k5y9fhWp/relax-swiming.jpg",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2jlXNJ8d0NJNHfgtWsJzAd6b6QE4Cn-2yzQ&usqp=CAU",
        "title":
            "When you are in the water, your body becomes buoyant, which means it feels lighter.",
      },
      {
        "image": "https://i.postimg.cc/bYnGRqsC/cycling.jpg",
        // "https://img1.goodfon.com/wallpaper/nbig/c/bd/devushka-beg-plyazh.jpg",
        "title":
            "Cycling is a popular physical activity, that can improve cardiovascular health, strengthen muscles, and enhance overall fitness.",
      },
      {
        "image": "https://i.postimg.cc/WzNQt2KN/nature-yoga.jpg",
        //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Nature travel can have many benefits, both for the traveler and the environment. It can promote conservation and awareness of natural resources.",
      },
      {
        "image": "https://i.postimg.cc/7ZntJv3b/skiping.jpg",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Skipping is a low-impact exercise that can be done almost anywhere and requires minimal equipment. All that is needed is a skipping rope and comfortable athletic shoes.",
      },
      {
        "image": "https://i.postimg.cc/W3gktVZH/gym-room2.png",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Setting up a gym room can be a great way to create a space for exercising and staying fit in the comfort of your own home.",
      },
    ];
    return SizedBox(
      // color: Colors.red,
      height: 300,
      child: ListView.builder(
        // controller: _popularTag,
        controller: _latestVideosSection,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 190,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,

                  // width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        videoData[index]["image"],
                      ),
                    ),
                  ),
                  child: Stack(children: [
                    Positioned(
                        bottom: 2,
                        right: 2,
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          color: Colors.white.withOpacity(0.6),
                          size: 50,
                        ))
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SizedBox(
                    child: rubikText(
                      text: videoData[index]['title'],
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox storiesList() {
    const List data = [
      {
        "image": "https://i.postimg.cc/qM1g1TYP/pushUp.jpg",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Stay up-to-date on routine healthcare checkups and screenings. ",
        // "Lorem ipsum dolor sitttt amet,psum dolor sit",
        "description":
            "Regular healthcare checkups and screenings are essential for maintaining good health and catching potential health issues early on. Establish a relationship with a primary care physician."
      },
      {
        "image": "https://i.postimg.cc/yNgPVncN/jem-room.jpg",
        //"https://hips.hearstapps.com/hmg-prod/images/woman-running-against-wall-royalty-free-image-930134532-1552999674.jpg?crop=0.667xw:1.00xh;0.286xw,0&resize=1200:*",
        "title": "Practice stress-management techniques.",
        //"Lorem ipsum dolor sitttt amet,psum dolor sit",
        "description":
            "Stress is a common problem in our modern world. It can be caused by many things, including work pressure, financial worries, health problems, and personal relationships. If left unchecked, stress can have serious consequences for our physical and mental health, including anxiety, depression, and high blood pressure. However, there are many stress-management techniques."
      },
      {
        "image": "https://i.postimg.cc/sgtWJzGV/rugbe-game.jpg",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2jlXNJ8d0NJNHfgtWsJzAd6b6QE4Cn-2yzQ&usqp=CAU",
        "title": "Make time for regular physical activity.",
        //"Lorem ipsum dolor sitttt amet,psum dolor sit",
        "description":
            "Regular physical activity is crucial for maintaining good health and well-being. Unfortunately, with our busy schedules, it can be challenging to make time for exercise. However, it's essential to prioritize physical activity to ensure that we stay healthy."
      },
      {
        "image": "https://i.postimg.cc/vHT6FTWY/run-image.jpg",
        // "https://img1.goodfon.com/wallpaper/nbig/c/bd/devushka-beg-plyazh.jpg",
        "title": "Eat a balanced and nutritious diet.",
        //"Lorem ipsum dolor sitttt amet,psum dolor sit",
        "description":
            "Maintaining a balanced and nutritious diet is essential for good health and wellbeing. A healthy diet not only provides your body with the necessary nutrients and energy, but it also helps to reduce the risk of chronic diseases such as heart disease, diabetes, and cancer."
      },
      {
        "image": "https://i.postimg.cc/MG7nbQ8D/photo-03.webp",
        //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Maintain social connections with family, friends, and colleagues.",
        "description":
            "Maintaining social connections with family, friends, and colleagues is crucial for our overall well-being and mental health. Social connections provide us with a sense of belonging, support, and happiness."
      },
      {
        "image": "https://i.postimg.cc/6qy6S7FF/Exercise-IMG1.webp",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Take care of your mental health by seeking help when you need it.",
        "description":
            "Mental health is a vital aspect of our overall well-being, and taking care of it is essential for living a fulfilling and productive life. Unfortunately, many people still feel hesitant to seek help for their mental health issues due to the stigma surrounding mental health."
      },
      {
        "image": "https://i.postimg.cc/2ybmGsZD/cycling.jpg",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Stay hydrated by drinking plenty of water throughout the day.",
        "description":
            "Staying hydrated is crucial for maintaining optimal health and wellbeing. Drinking plenty of water throughout the day can help you feel energized, improve your digestion, support your immune system, and even boost your brain function. In this blog, we'll explore some of the benefits of staying hydrated and offer tips on how to incorporate more water into your daily routine."
      },
    ];
    return SizedBox(
      height: 480,
      child: ListView.builder(
        controller: _storiesSection,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            // color: Colors.green,
            width: 320,
            decoration: const BoxDecoration(
              color: Colors.white,
              //  border: Border.all(color: Colors.black)
            ),
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        data[index]["image"],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      storiesButtons(
                        text: "Design",
                        backgroundColor: Colors.grey.withOpacity(0.2),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      storiesButtons(
                        text: "Idea",
                        backgroundColor: Colors.grey.withOpacity(0.2),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      storiesButtons(
                        text: "Review",
                        backgroundColor: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  // width: 200,
                  child: rubikText(
                    text: data[index]["title"],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Expanded(
                //   child: SizedBox(
                //     width: 350,
                //     child: rubikText(
                //       text: data[index]["description"],
                //       fontSize: 10,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox popularTagsList() {
    const List data = [
      {
        "image":
            "https://images.squarespace-cdn.com/content/v1/5d31ed671abe780001b2964d/1564527355472-A8QA0TTO82U1GR2ND26D/handstand+tutorial",
        "type": "Idea",
      },
      {
        "image":
            "http://static1.squarespace.com/static/53b839afe4b07ea978436183/53bbeeb2e4b095b6a428a13e/5fd2570b51740e23cce97919/1676678395594/traditional-food-around-the-world-Travlinmad.jpg?format=1500w",
        "type": "Lifestyle",
      },
      {
        "image":
            "https://ichef.bbci.co.uk/news/976/cpsprodpb/B9FF/production/_117751674_satan-shoes1.jpg",
        "type": "Design",
      },
      {
        "image":
            "https://images.indianexpress.com/2022/03/GettyImages-healthy-living-1200.jpg",
        "type": "Health",
      },
      {
        "image":
            "https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?cs=srgb&dl=pexels-vecislavas-popa-1571460.jpg&fm=jpg",
        "type": "Interior",
      },
      {
        "image": "https://thumbs.dreamstime.com/z/eco-logo-26401238.jpg",
        "type": "Eco",
      },
      {
        "image":
            "https://blog.hubspot.com/hubfs/00-Blog_Thinkstock_Images/how-to-write-a-podcast-review.png",
        "type": "Review",
      },
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 100,
      child: ListView.builder(
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 70,
        // ),
        controller: _popularTag,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 165,
              // height: 170,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    data[index]["image"],
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: data[index]["type"].length * 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: rubikText(
                          text: data[index]["type"],
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox latestNewsList() {
    const List latestNews = [
      {
        "image": "https://i.postimg.cc/T2kTdXD2/Mygalf1.png",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "GALF Founder And CEO Amit Vasistha Promotes Aspiring Entrepreneurs.",
        "status": "News"
      },
      {
        "image": "https://i.postimg.cc/x8DRzdqr/Mygalf2.png",
        //"https://hips.hearstapps.com/hmg-prod/images/woman-running-against-wall-royalty-free-image-930134532-1552999674.jpg?crop=0.667xw:1.00xh;0.286xw,0&resize=1200:*",
        "title":
            "What Is Technostress And How Can We Protect Our Workforce From It",
        "status": "News"
      },
      {
        "image": "https://i.postimg.cc/wT958Zmk/Mygalf3.png",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2jlXNJ8d0NJNHfgtWsJzAd6b6QE4Cn-2yzQ&usqp=CAU",
        "title":
            "The Importance Of Sleep In The Workplace: How Corporates Can Address Poor Sleep Habits",
        "status": "News"
      },
      {
        "image": "https://i.postimg.cc/cJ3t8B3H/Mygalf4.png",
        // "https://img1.goodfon.com/wallpaper/nbig/c/bd/devushka-beg-plyazh.jpg",
        "title":
            "Union Budget 2023-2024: Post Budget Reactions From Tech Experts",
        "status": "News"
      },
      {
        "image": "https://i.postimg.cc/d0RtYHd8/Mygalf5.png",
        //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "2023 Budget Expectations Updates (Jan 29): Tax Relief For Salaried, Middle-Class, Senior Citizens Expected",
        "status": "News"
      },
      {
        "image": "https://i.postimg.cc/2ysP3mN3/Mygalf6.png",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title": "Expert Predictions For The Future Of Technology In 2023",
        "status": "News"
      },
      {
        "image": "https://i.postimg.cc/3JgKpfSz/Mygalf7.png",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTitWXYBOiucB7TlhUxJnr-gCLPcLW7TrwmhA&usqp=CAU",
        "title":
            "Twitter Fiasco: Experts Discuss Workplace Management Ethics To Avoid Mismanaged Hiring And Firing",
        "status": "News"
      },
    ];
    return SizedBox(
      height: 180,
      child: ListView.builder(
        controller: _latestNewsSection,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            // height: 200,
            margin: const EdgeInsets.only(right: 15),
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    //"https://thumbs.dreamstime.com/b/yoga-tropic-garden-25823791.jpg",
                    latestNews[index]['image']),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 17,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: rubikText(
                        text: latestNews[index]['status'],
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    latestNews[index]['title'],
                    style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                  // rubikText(
                  //   text: "Lorem ipsum dolor sitttt amet,psum dolor sit",
                  //   fontSize: 11,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/readmore");
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                150,
                60,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Colors.black,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                rubikText(
                  text: "READ MORE ",
                  fontSize: 15,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 12,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.grey.withOpacity(0.2),
          )
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
}
