import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_galf/components/footer.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoungePage extends StatefulWidget {
  const LoungePage({Key? key}) : super(key: key);

  @override
  _LoungePageState createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage> {
  ScrollController _scrollController = ScrollController();
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
      body: Container(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Navbar(currentScreen: currentScreen),
            PopularTag(context: context, currentScreen: currentScreen),
            const SizedBox(
              height: 90,
            ),
            BestStories(
                context: context,
                currentScreen: currentScreen,
                scrollController: _scrollController),
            const SizedBox(
              height: 90,
            ),
            LatestVideo(context: context, currentScreen: currentScreen),
            LatestNews(context: context, currentScreen: currentScreen),
            NewsList(context: context, currentScreen: currentScreen),
            Footer(context: context),
          ],
        ),
      ),
    );
  }

  Widget PopularTag({required context, required currentScreen}) {
    return UnconstrainedBox(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Popular Tag",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: currentScreen == "big"
                    ? 8
                    : currentScreen == "medium"
                        ? 4
                        : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // mainAxisSpacing: 2.0,/
                children: List.generate(8, (index) {
                  return PopularTagCard(
                      context: context, currentScreen: currentScreen);
                }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget BestStories(
      {required context, required currentScreen, required scrollController}) {
    return UnconstrainedBox(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Get started with our best stories",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: GridView.count(
                // childAspectRatio: 1 / 0.8,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: currentScreen == "big"
                    ? 4
                    : currentScreen == "medium"
                        ? 2
                        : 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // mainAxisSpacing: 2.0,/
                children: List.generate(4, (index) {
                  return BestStoriesCard(
                      context: context, currentScreen: currentScreen);
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget LatestVideo({required context, required currentScreen}) {
    return Container();
  }

  Widget LatestNews({required context, required currentScreen}) {
    return Container();
  }

  Widget NewsList({required context, required currentScreen}) {
    return Container();
  }

  Widget PopularTagCard({required context, required currentScreen}) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: currentScreen == "big"
                      ? 138
                      : currentScreen == "small"
                          ? 138
                          : 138,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/events_card1.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BestStoriesCard({required context, required currentScreen}) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: currentScreen == "big"
                      ? 180
                      : currentScreen == "small"
                          ? 180
                          : 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/events_card1.jpg"),
                    ),
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
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
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
                                  color: Color.fromARGB(66, 8, 8, 8),
                                ),
                              ),
                            )
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
}
