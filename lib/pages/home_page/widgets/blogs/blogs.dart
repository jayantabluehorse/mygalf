import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_blog.dart';
import 'package:get/get.dart';

class Blogs extends StatelessWidget {
  Blogs({super.key});

  List blogData = [
    {
      "image": "assets/images/MyGalf_Blog1.bmp",
      "title": "Health Meal-Steamed Salad Along With Green Juice"
    },
    {"image": "assets/images/MyGalf_Blog2.bmp", "title": "Why NirvanaFitness?"},
    {
      "image": "assets/images/MyGalf_Blog3.bmp",
      "title": "Health Meal-Steamed Salad Along With Green Juice"
    },
    {
      "image": "assets/images/MyGalf_Blog4.bmp",
      "title": "Nutrition: Benefits of Drinking Warm Waters"
    },
    {"image": "assets/images/MyGalf_Blog5.bmp", "title": "Child Pose Stretch"},
    {
      "image": "assets/images/MyGalf_Blog6.bmp",
      "title": "Yoga: PawanMuktasana (Wind Relieving Asana)"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            "Blogs",
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Color(0xFF1A3E4E),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Learn about the latest trends and topics on Corporate\nWellness with the Galf Blog.",
            style: GoogleFonts.rubik(
              fontSize: 18,
              color: const Color(0xFF374651),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            // color: Colors.green,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Wrap(
              children: [...blogData.map((e) => SingleBlog(data: e))],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 218,
            height: 64,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F7FDC)),
              onPressed: () {
                Get.toNamed('/lounge');
              },
              child: Text(
                "View More",
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
