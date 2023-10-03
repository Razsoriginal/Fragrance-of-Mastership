import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class SearchField extends StatelessWidget {
  final double length;
  final String textHint;

  const SearchField({
    super.key,
    this.length = 1,
    required this.textHint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * length,
      height: 50,
      decoration: BoxDecoration(
        color: fSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
          // search delegate code
        },
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: textHint,
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9),
            )),
      ),
    );
  }
}
