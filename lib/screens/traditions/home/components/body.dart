import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/home/components/tradition_list.dart';
import 'package:fragrance_of_mastership/screens/traditions/home/components/traditions_header.dart';

import '../../../../components/custom_tabbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabTitle = [
      "All",
      "Volume 1",
      "Volume 2",
      "Volume 3",
      "Volume 4",
      "Volume 5",
      "Volume 6",
      "Volume 7",
    ];
    const List<Widget> tabWidgets = [
      TraditionList(
        volume: 0,
      ),
      TraditionList(
        volume: 1,
      ),
      TraditionList(
        volume: 2,
      ),
      TraditionList(
        volume: 3,
      ),
      TraditionList(
        volume: 4,
      ),
      TraditionList(
        volume: 5,
      ),
      TraditionList(
        volume: 6,
      ),
      TraditionList(
        volume: 7,
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TraditionsHeader(), // search bar and title
            CustomTabBar(
              title: tabTitle,
              page: tabWidgets,
            ),
          ],
        ),
      ),
    );
  }
}
