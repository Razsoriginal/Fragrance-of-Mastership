import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {super.key,
      required this.title,
      required this.page,
      this.initialTabTitle = ''});

  final List<String> title;
  final List<Widget> page;
  final String initialTabTitle;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    int? initialTabIndex = getIndexByText(widget.initialTabTitle);
    _tabController = TabController(
        length: widget.title.length,
        vsync: this,
        initialIndex: initialTabIndex);
  }

  int getIndexByText(String text) {
    if (text.isNotEmpty) {
      String lowercaseText = text.toLowerCase();
      for (int i = 0; i < widget.title.length; i++) {
        if (widget.title[i].toLowerCase() == lowercaseText) {
          return i;
        }
      }
      return 0;
    }
    return 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        TabBar(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          dividerColor: Colors.transparent,
          labelColor: fPrimaryColor,
          controller: _tabController,
          isScrollable: true,
          tabs: widget.title.map((item) {
            return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: fSecondaryColor.withOpacity(0.1),
                ),
                child: Tab(
                  text: item,
                ));
          }).toList(),
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: fPrimaryLightColor,
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TabBarView(
              controller: _tabController,
              children: widget.page.map((item) {
                return Tab(child: item);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
