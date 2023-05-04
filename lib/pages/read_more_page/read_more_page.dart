import 'package:flutter/material.dart';
import '../../components/footer.dart';
import '../lounge_page/lounge_page.dart';
import '../../components/navbar.dart';
import '../lounge_page/widget/lounge_page_comonant.dart';

class ReadMorePage extends StatelessWidget {
  const ReadMorePage({super.key});

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 115,
        elevation: 0,
        flexibleSpace:
            Navbar(currentScreen: currentScreen, selected: 'products'),
      ),
      body: ListView(
        children: [
          LoungePageComponent(),
          Footer(context: context),
        ],
      ),
    );
  }
}
