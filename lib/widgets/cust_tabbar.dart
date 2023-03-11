/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';


class razs_tabbar extends StatefulWidget {
  final List<String> title;
  final List<Widget> page;
  const razs_tabbar({Key? key, required this.title, required this.page}) : super(key: key);

  @override
  State<razs_tabbar> createState() => _razs_tabbarState();
}

class _razs_tabbarState extends State<razs_tabbar> with TickerProviderStateMixin{
  _razs_tabbarState();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: widget.title.length, vsync: this);
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelStyle: TextStyle(fontSize: 15),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BubbleTabIndicator(
                      indicatorHeight: 25.0,
                      indicatorColor: Colors.blueAccent,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      // Other flags
                      // indicatorRadius: 1,
                      // insets: EdgeInsets.all(1),
                      // padding: EdgeInsets.all(10)
                    ),
    */
/*MaterialIndicator(
                      // height: 5,
                      color: Theme.of(context).secondaryHeaderColor,
                      // topLeftRadius: 5, topRightRadius: 5,
                      // tabPosition: TabPosition.bottom,
                      paintingStyle: PaintingStyle.fill,
                    ),*//*

                    tabs: widget.title.map((item) {
                      return Tab(text: item);
                    }).toList(),
                    */
/*const [
                        Tab(text:"For you"),
                        Tab(text: "Top charts"),
                        Tab(text: "Kids",),
                        Tab(text: "Categories",),
                      ]*//*

                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  width: Get.width,
                  height: 0.5,
                  color: Colors.grey,
                )
              ],
            ),

          ),
        ),
        Container(
            // margin: const EdgeInsets.only(left: 15, top: 10),
            //width: double.maxFinite,
            height: 605,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: widget.page.map((item) {
                return Tab(child: item);
              }).toList(),
              */
/*[
                apps_foryou(),
                apps_topcharts(),
                apps_kids(),
                apps_categories(),
              ],*//*

            )
        ),
      ],
    );
  }
}*/
