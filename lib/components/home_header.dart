import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/search_field.dart';

import '../constants/constants.dart';
import '../constants/sizes.dart';

// used for tradition/ articles home page
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            title,
            style: headingStyle,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SearchField(
            textHint: "Search $title",
          ),
        ),
      ],
    );
  }
}
