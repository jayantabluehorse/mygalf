import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_galf/components/navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

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
        flexibleSpace: Navbar(currentScreen: currentScreen, selected: '404'),
      ),
      body: SizedBox(
        width: currentWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/direction.svg",
              color: const Color(0xFF1A3E4E),
              height: 200,
              width: 150,
            ),
            const SizedBox(height: 50),
            const Text(
              "Page not found...",
              style: TextStyle(
                  color: Color(0xFF1A3E4E),
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Get.toNamed("/");
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                height: 55,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF1A3E4E),
                ),
                child: Text(
                  "Go Back To Home".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
