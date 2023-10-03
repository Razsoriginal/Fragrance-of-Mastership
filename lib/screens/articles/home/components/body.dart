import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/components/custom_tabbar.dart';
import 'package:fragrance_of_mastership/screens/articles/home/components/articles_list.dart';

import '../../../../components/home_header.dart';

class Body extends StatelessWidget {
  const Body({super.key, this.tabName = ''});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    // take this list from the server
    final List<String> title = [
      "All",
      "Ahle Tasannun",
      "Raafezi",
      "Batrism",
      "Mahdaviyyat"
    ];

    const List<Widget> tabWidgets = [
      ArticlesList(
        category: '',
      ),
      ArticlesList(category: 'Ahle Tasannun'),
      ArticlesList(category: 'Raafezi'),
      ArticlesList(category: 'Batrism'),
      ArticlesList(category: 'Mahdaviyyat'),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(
            title: 'Articles',
          ),
          CustomTabBar(
            title: title,
            page: tabWidgets,
            initialTabTitle: tabName,
          ),
        ],
      ),
    );
  }
}
