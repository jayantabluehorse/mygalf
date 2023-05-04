import 'package:flutter/material.dart';

class ShopByBrand extends StatelessWidget {
  const ShopByBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Shop By Brand"),
          const SizedBox(height: 5),
          Container(
            color: Colors.pink,
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 80,
                    width: 80,
                    color: Colors.green,
                    child: const Text("data"),
                  );
                }),
          )
        ],
      ),
    );
  }
}
