import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Crousel extends StatelessWidget {
  const Crousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage("images/first.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage("images/third.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage("images/second.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
        options: CarouselOptions(
          height: 180,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 3 / 2,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 900),
          viewportFraction: 0.8,
        ));
  }
}
