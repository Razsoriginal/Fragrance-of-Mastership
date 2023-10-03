import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../hadith_page/hadith_page.dart';

class TraditionTitle extends StatelessWidget {
  const TraditionTitle({
    super.key,
    required this.traditionNumber,
    required this.title,
    required this.index,
  });

  final int traditionNumber;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HadithPage(index: index))),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            leading: Container(
              height: getProportionateScreenWidth(35),
              width: getProportionateScreenWidth(35),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(fArabicEndPunct),
              )),
              child: Center(
                child: Text(
                  traditionNumber.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
