import 'package:flutter/material.dart';

class Fetures extends StatelessWidget {
  List featureData = [
    {
      "name": "secured payment",
      "details": "ssl encryption on all transactons",
      "image": "assets/icons/cart_lock.png"
    },
    {
      "name": "Emi ",
      "details": "available emi on several banks",
      "image": "assets/icons/cart_emi.png"
    },
    {
      "name": "active support",
      "details": "get in touch if you have a problem",
      "image": "assets/icons/cart_question.png"
    }
  ];

  Fetures({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.8,
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [...featureData.map((e) => feature(e, context))],
      ),
    );
  }

  Widget feature(e, context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40, width: 40, child: Image.asset(e['image'])),
          const SizedBox(height: 10),
          Text(
            e['name'].toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(e['details'].toUpperCase())
        ],
      ),
    );
  }
}
