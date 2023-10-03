import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.heroTitle,
    required this.herSubTitle,
    required this.heroGradient,
  });

  final String heroTitle;
  final String herSubTitle;
  final Gradient heroGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        gradient: heroGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text.rich(
        TextSpan(
          text: heroTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
          children: [
            TextSpan(
                text: "\n$herSubTitle",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
