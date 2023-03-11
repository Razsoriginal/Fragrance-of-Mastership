import 'package:flutter/material.dart';
import 'package:fragrance/screens/Categories/cat_foryou.dart';
import 'package:fragrance/screens/Categories/cat_following.dart';
import 'package:fragrance/screens/Categories/cat_science.dart';
import 'package:fragrance/screens/Categories/categories_page.dart';

class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _home_page();
}

class _home_page extends State<home_page> with TickerProviderStateMixin{
  _home_page();

  @override
  Widget build(BuildContext context) {
    List<String> title = ['For you', 'Topic 1', 'Topic 2', 'Topic 3', '+'];
    List<Widget> page = [cat_foryou(), cat_following() , cat_science(), cat_science(), categories_page(), ];
    TabController _tabController = TabController(length: title.length, vsync: this);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Fragrance of Mastership', style: TextStyle(fontSize: 20),),
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_active_outlined))
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: title.map((item) {
            return Tab(text: item);
          }).toList(),
        ),
      ),
      body: Container(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: page.map((item) {
              return Tab(child: item);
            }).toList(),
          )
      ),
    );
  }
}
