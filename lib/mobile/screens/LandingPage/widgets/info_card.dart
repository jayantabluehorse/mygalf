import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_galf/mobile/screens/components/theme.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 1, 70, 140),
      ),
      height: 183,
      width: 308,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Akash Singh".toUpperCase(),
            style: GalfTheme.galfHeading2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/foot.svg",
                      height: 31,
                      width: 30,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "1,274 Steps",
                      style: TextStyle(color: GalfTheme.galfTextColor),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Step Taken",
                      style: GalfTheme.galfSubHeading2,
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Calory.svg",
                      height: 31,
                      width: 30,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "250",
                      style: TextStyle(color: GalfTheme.galfTextColor),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Calories",
                      style: GalfTheme.galfSubHeading2,
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/galfCoin.svg",
                      height: 31,
                      width: 30,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "₹1,55,600",
                      style: TextStyle(color: GalfTheme.galfTextColor),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Galf Coins",
                      style: GalfTheme.galfSubHeading2,
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 120,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Reconnect",
                  style: GalfTheme.galfSubHeading2,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "View Dashbord",
                  style: GalfTheme.galfSubHeading1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
