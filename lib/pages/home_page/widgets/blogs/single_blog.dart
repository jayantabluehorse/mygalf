import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleBlog extends StatelessWidget {
  final Map data;
  const SingleBlog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        Get.toNamed('/read-more');
      },
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 250, maxHeight: 300, minWidth: 300, maxWidth: 400),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(39, 158, 158, 158),
                  spreadRadius: 2,
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(
                  minHeight: 200, maxHeight: 250, minWidth: 300, maxWidth: 400),
              // height: 200,
              // width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(data['image']),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data['title'],
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF374651),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
