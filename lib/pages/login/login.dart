import 'package:flutter/material.dart';
import 'package:my_galf/components/navbar.dart';

class loginPage extends StatelessWidget {
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
          flexibleSpace: Navbar(currentScreen: currentScreen),
        ),
        body: Container(
          child: Column(
            children: [LoginTop(), LoginContent(currentWidth)],
          ),
        ));
  }

  Widget LoginTop() {
    return Container(
      padding: EdgeInsets.only(left: 160, right: 160),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            " Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(" HOME/LOGIN"),
        ],
      ),
    );
  }

  Widget LoginContent(currentWidth) {
    return SizedBox(
      child: Stack(
        children: [
          Background(currentWidth),
          BgImage(currentWidth),
          Positioned(top: 40, right: 120, child: LoginForm()),
        ],
      ),
    );
  }

  Widget Background(currentWidth) {
    return Container(
      width: currentWidth,
      height: 545,
      color: Color.fromARGB(38, 47, 183, 37),
    );
  }

  Widget BgImage(currentWidth) {
    return Container(
      height: 545,
      width: currentWidth / 1.5,
      color: Color.fromARGB(29, 33, 149, 243),
      child: Image.asset("assets/images/loginBg.png"),
    );
  }

  Widget LoginForm() {
    return Container(
      child: Container(
        color: Color.fromARGB(52, 244, 67, 54),
        height: 500,
        width: 500,
      ),
    );
  }
}
