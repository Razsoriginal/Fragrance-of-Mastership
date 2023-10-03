import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/search_field.dart';
import 'package:fragrance_of_mastership/screens/notifications/home/notifications_home.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../profile/user_profile/profile_screen.dart';
import 'icon_btn_with_counter.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(
            length: 0.6,
            textHint: 'Search Traditions',
          ),
          IconBtnWithCounter(
            svgSrc: fBellSvg,
            numOfItems: 3,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsHome(),
                ),
              );
            },
          ),
          IconBtnWithCounter(
            svgSrc: fUserSvg,
            press: () => Navigator.pushNamed(context, ProfileScreen.routeName),
          ),
        ],
      ),
    );
  }
}
