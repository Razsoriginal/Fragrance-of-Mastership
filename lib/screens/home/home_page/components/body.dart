import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/section_title.dart';
import 'package:fragrance_of_mastership/constants/constants.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/constants/text_strings.dart';
import 'package:fragrance_of_mastership/screens/home/home_page/components/quick_links.dart';

import '../../../../constants/colors.dart';
import '../../../traditions/components/top_traditions.dart';
import '../../../traditions/home/traditions_screen.dart';
import 'articles_banner.dart';
import 'hero_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const HomePageHeader(),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const HeroBanner(
              heroTitle: fHeroTitle,
              herSubTitle: fHeroSubTitle,
              heroGradient: fPrimaryGradientColor,
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const QuickLinks(
              fQuickLinks: fQuickLinks,
              page: fQuickLinksWidgets,
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const ArticleCategory(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            SectionTitle(
              text: 'Traditions',
              press: () {
                Navigator.pushNamed(context, TraditionsScreen.routeName);
              },
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            const TopTraditions(),
          ],
        ),
      ),
    );
  }
}
