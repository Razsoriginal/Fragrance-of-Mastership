import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../hadith_page.dart';

class PreviousNextHadith extends StatelessWidget {
  const PreviousNextHadith({
    super.key,
    required this.preTitle,
    required this.index,
    required this.nextTitle,
  });

  final String preTitle;
  final int index;
  final String nextTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.44,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (preTitle.isNotEmpty) ...[
                  const Text(
                    "Previous Hadith",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    child: Text(preTitle),
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HadithPage(index: index - 1))),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.44,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (nextTitle.isNotEmpty) ...[
                  const Text("Next Hadith",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: GestureDetector(
                        child: Text(nextTitle),
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HadithPage(index: index + 1))),
                      )),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
