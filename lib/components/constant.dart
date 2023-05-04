import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

var myLoader = SizedBox(
    height: 700,
    width: double.infinity,
    child: Center(
        child: SizedBox(
            height: 125,
            width: 125,
            child: Image.asset("assets/images/loader_big.gif"))));
// var MyLoader = const SizedBox(
//   height: 500,
//   child: SpinKitFadingCube(
//     color: Colors.blue,
//     size: 50.0,
//   ),
// );
var spinnerLoader = const SizedBox(
  height: 500,
  child: SpinKitRing(
    color: Colors.blue,
    size: 50.0,
  ),
);

const String staticToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE2ODAxNzU2MjV9.2XoxAOIM9R0jlfW2x7E4qsYIfO5ob43VQHGzXC0erlU";

const String staticTokenforGet =
    "Bearer 5ec6136ffcf14cd59fc1046036efd4e7618cce51abfa1e02b3cbe6189b3f17196612f1c00a6f96309450921d9a7bb2d734b6c87ff17bc3531f8a45f1d08fffeefd9af41239150c18500c22bddcd00859c75b6707f6003dad43586b42f6d2ffd00bc3a43eca818efaaf54f41659dd7713b85a8d6e74dd92a6fdc2ca339b184dfb";
Widget myemptyDataView({required context, image}) {
  return SizedBox(
    height: 400,
    width: MediaQuery.of(context).size.width,
    // color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/noSearch.svg",
          height: 80,
          width: 80,
          color: const Color(0xFF1A3E4E),
        ),
        const SizedBox(height: 20),
        const Text(
          "Sorry! No result found  :(",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
            "We're sorry what you were loading for.Please try another way"),
        const SizedBox(height: 30)
      ],
    ),
    // decoration: const BoxDecoration(
    //     image: DecorationImage(
    //         fit: BoxFit.fill,
    //         image: NetworkImage(
    //             "https://media.tenor.com/unvXyxtdn3oAAAAC/no-result.gif"))),
  );
}

snackbar({required context, required response, required type}) {
  return Get.snackbar(
      type == "error" ? "error !" : "Success", response.toString(),
      backgroundColor: type == "error" ? Colors.red : Colors.green,
      colorText: Colors.white,
      maxWidth: MediaQuery.of(context).size.width * 0.30,
      margin: const EdgeInsets.only(top: 20));
}
