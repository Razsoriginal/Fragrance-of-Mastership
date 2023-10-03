import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/sizes.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key, required this.fQuickLinks, required this.page});

  final List<Map<String, dynamic>> fQuickLinks;
  final List<Widget> page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            fQuickLinks.length,
            (index) => QuickLinksCard(
              icon: fQuickLinks[index]["icon"],
              text: fQuickLinks[index]["text"],
              press: () {
                if (index >= 0 && index < page.length) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => page[index],
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class QuickLinksCard extends StatelessWidget {
  const QuickLinksCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
