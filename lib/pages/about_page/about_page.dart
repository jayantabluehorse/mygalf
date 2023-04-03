import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../components/footer.dart';
import '../../components/navbar.dart';
import './about_controller.dart';
import '../../utils/icons.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final xController = Get.put(AboutController());
  int isHover = -1;
  int isHoverTwo = -1;
  void updateHover(index) {
    setState(() {
      isHover = index;
    });
  }

  void updateHoverTwo(index) {
    setState(() {
      isHoverTwo = index;
    });
  }

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
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Navbar(currentScreen: currentScreen),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/about_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 120,
                  ),
                  _whatIsGalf(context: context, currentScreen: currentScreen),
                  const SizedBox(
                    height: 100,
                  ),
                  _trueWellness(
                      context: context,
                      currentScreen: currentScreen,
                      isHover: isHover),
                  const SizedBox(
                    height: 100,
                  ),
                  _ourCompany(context: context, currentScreen: currentScreen),
                  const SizedBox(
                    height: 110,
                  ),
                  __advisoryBoard(
                      context: context,
                      currentScreen: currentScreen,
                      scrollController: scrollController),
                  const SizedBox(
                    height: 110,
                  ),
                  __blogStories(
                      context: context,
                      currentScreen: currentScreen,
                      isHoverTwo: isHoverTwo),
                  const SizedBox(
                    height: 110,
                  ),
                ],
              ),
            ),
            Footer(context: context),
          ],
        ),
      ),
    );
  }

  Widget _whatIsGalf({required context, required currentScreen}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What is GALF',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF314584),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Get A Life Fitness LLP (Popularly known as GALF ® ) is a fast growing wellness aggregator firm. We are based in Mumbai, have PAN India presence and global aspirations. GALF Wellness App and Customized Interventions based Holistic Wellness Ecosystem can create differentiating factor for employers and brands.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Our comprehensive rewards linked digital market place proposition helps nurture a strong organic culture of wellness in societies we operate.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'We are constantly innovating on basis of customer feedback using AI and Machine Learning to gamify and customize our holistic wellness offerings.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text(
                          'Get in Touch',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset("assets/images/about_1.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _trueWellness(
      {required context, required currentScreen, required isHover}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'A True Wellness Aggregator',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF314584),
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868C90),
                          height: 1.5,
                        ),
                        maxLines: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: MouseRegion(
                          onEnter: (event) {
                            updateHover(1);
                          },
                          onExit: (event) {
                            updateHover(-1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isHover == 1
                                  ? const Color(0xFF2F7FDC)
                                  : const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isHover == 1
                                    ? Image.asset(
                                        "assets/images/about_icon_1.png")
                                    : Image.asset(
                                        "assets/images/about_icon_1b.png"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Wellness Marketplace",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: isHover == 1
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Opportunity to sell corporate products and merchandise on #GALFShop wellness marketplace",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: isHover == 1
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: MouseRegion(
                          onEnter: (event) {
                            updateHover(2);
                          },
                          onExit: (event) {
                            updateHover(-1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isHover == 2
                                  ? const Color(0xFF2F7FDC)
                                  : const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isHover == 2
                                    ? Image.asset(
                                        "assets/images/about_icon_2w.png")
                                    : Image.asset(
                                        "assets/images/about_icon_2.png"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Corporate wellness programs & ecosystem",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: isHover == 2
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Inter-departmental wellness initiatives and communities using #GALF engine",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: isHover == 2
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 120,
                      ),
                      Container(
                        child: MouseRegion(
                          onEnter: (event) {
                            updateHover(3);
                          },
                          onExit: (event) {
                            updateHover(-1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isHover == 3
                                  ? const Color(0xFF2F7FDC)
                                  : const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isHover == 3
                                    ? Image.asset(
                                        "assets/images/about_icon_2w.png")
                                    : Image.asset(
                                        "assets/images/about_icon_2.png"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Boutique wellness events",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: isHover == 3
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Customized holistic corporate wellness events. Registration at discounted charges for GALF retail wellness events",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: isHover == 3
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: MouseRegion(
                          onEnter: (event) {
                            updateHover(4);
                          },
                          onExit: (event) {
                            updateHover(-1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isHover == 4
                                  ? const Color(0xFF2F7FDC)
                                  : const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isHover == 4
                                    ? Image.asset(
                                        "assets/images/about_icon_2w.png")
                                    : Image.asset(
                                        "assets/images/about_icon_2.png"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Holistic wellness mobile app",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: isHover == 4
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Easy to use and turnkey techwellness ecosystem for corporate clients",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: isHover == 4
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF314584),
                                  ),
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _ourCompany({required context, required currentScreen}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Image.asset("assets/images/about.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'OUR COMPANY',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB6B6B6),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Some Fine Words About Us',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF314584),
                          height: 1.5,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: 400,
                        height: 165,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFDBDBDB),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "VISSION",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF434343),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "To be the most respected, wellness aggregator brand in the markets we operate",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF757575),
                                height: 1.5,
                              ),
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: 400,
                        height: 165,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFDBDBDB),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "MISSION",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF434343),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Make “Wellness” a lifestyle for the communities globally",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF757575),
                                height: 1.5,
                              ),
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: 400,
                        height: 165,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFDBDBDB),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "VALUES",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF434343),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Respect , Integrity , Passion , Service",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF757575),
                                height: 1.5,
                              ),
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget __advisoryBoard(
      {required context, required currentScreen, required scrollController}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            const Text(
              'Strategic Advisory Board',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w700,
                color: Color(0xFF314584),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.73,
              height: 450,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                controller: scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return __advisoryBoardScroll(index: index);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    scrollController.animateTo(
                      scrollController.offset - 335.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    scrollController.animateTo(
                      scrollController.offset + 335.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget __advisoryBoardScroll({required int index}) {
    return Container(
      width: 320,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                "${xController.featuresList[index]['image']}",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Icon(Icons.more_vert),
            Text(
              "${xController.featuresList[index]['name']}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${xController.featuresList[index]['description']}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D2D2D),
                height: 1.5,
              ),
              maxLines: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 280,
              child: Divider(
                height: 5,
                color: Color(0xFF818181),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${xController.featuresList[index]['degnation']}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D2D2D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget __blogStories(
      {required context, required currentScreen, required isHoverTwo}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'BLOG STORIES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF909090),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Check Our News',
              style: TextStyle(
                fontSize: 49,
                fontWeight: FontWeight.w700,
                color: Color(0xFF314584),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MouseRegion(
                  onEnter: (event) {
                    updateHoverTwo(1);
                  },
                  onExit: (event) {
                    updateHoverTwo(-1);
                  },
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: isHoverTwo == 1
                          ? const Color(0xFF2F7FDC)
                          : const Color(0xFFFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFF6E757A),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "New Adventure",
                          style: TextStyle(
                            color: isHoverTwo == 1
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF314584),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "17 March 2019",
                          style: TextStyle(
                            color: isHoverTwo == 1
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF6E757A),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Lorem ipsum sit amet, consectetur adipisicing Lorem ipsum sit amet, consectetur  adipisicingsectetur adipisicing",
                          style: TextStyle(
                            color: isHoverTwo == 1
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF314584),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_forward,
                              color: isHoverTwo == 1
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF6E757A),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (event) {
                    updateHoverTwo(2);
                  },
                  onExit: (event) {
                    updateHoverTwo(-1);
                  },
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: isHoverTwo == 2
                          ? const Color(0xFF2F7FDC)
                          : const Color(0xFFFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFF6E757A),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "New Adventure",
                          style: TextStyle(
                            color: isHoverTwo == 2
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF314584),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "17 March 2019",
                          style: TextStyle(
                            color: isHoverTwo == 2
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF6E757A),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Lorem ipsum sit amet, consectetur adipisicing Lorem ipsum sit amet, consectetur  adipisicingsectetur adipisicing",
                          style: TextStyle(
                            color: isHoverTwo == 2
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF314584),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_forward,
                              color: isHoverTwo == 2
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF6E757A),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (event) {
                    updateHoverTwo(3);
                  },
                  onExit: (event) {
                    updateHoverTwo(-1);
                  },
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: isHoverTwo == 3
                          ? const Color(0xFF2F7FDC)
                          : const Color(0xFFFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFF6E757A),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "New Adventure",
                          style: TextStyle(
                            color: isHoverTwo == 3
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF314584),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "17 March 2019",
                          style: TextStyle(
                            color: isHoverTwo == 3
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF6E757A),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Lorem ipsum sit amet, consectetur adipisicing Lorem ipsum sit amet, consectetur  adipisicingsectetur adipisicing",
                          style: TextStyle(
                            color: isHoverTwo == 3
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF314584),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_forward,
                              color: isHoverTwo == 3
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF6E757A),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
