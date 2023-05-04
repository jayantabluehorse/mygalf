import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/shop_by_category.dart';
import 'widgets/bottom.dart';
import 'widgets/crousel.dart';
import 'widgets/info_card.dart';
import 'widgets/shop_by_brand.dart';
import 'widgets/top_picks.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: AppBar(
        leading: SvgPicture.asset(
          "assets/icons/logo.svg",
          color: Colors.white,
          height: 50,
          width: 50,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.search),
            SizedBox(width: 5),
            Icon(Icons.wallet),
            SizedBox(width: 5),
            Text("₹130")
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          InfoCard(),
          SizedBox(height: 5),
          Crousel(),
          SizedBox(height: 5),
          ShopByBrand(),
          TopPicks(),
          ShopByCategory(),
          Bottom()
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 80,
        color: Colors.pink,
      ),
    );
  }
}
