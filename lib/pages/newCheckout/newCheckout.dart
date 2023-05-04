import 'package:flutter/material.dart';

import '../../components/navbar.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 115,
        flexibleSpace:
            Navbar(currentScreen: currentScreen, selected: 'checkout'),
      ),
      body: Container(
        width: currentWidth / 1.25,
        alignment: Alignment.center,
        color: const Color.fromARGB(110, 255, 21, 0),
        child: Column(
          children: const [
            SizedBox(height: 25),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
