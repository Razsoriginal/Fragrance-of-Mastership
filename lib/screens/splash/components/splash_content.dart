import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class SplashContents extends StatelessWidget {
  const SplashContents({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          fShortTitle,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: fPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text, textAlign: TextAlign.center,),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenWidth(235),
          width: getProportionateScreenHeight(265),
        )
      ],
    );
  }
}
