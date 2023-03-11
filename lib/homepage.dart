import 'package:flutter/material.dart';
import 'package:fragrance/screens/collections_page.dart';
import 'package:fragrance/screens/home_page.dart';
import 'package:fragrance/screens/search_page.dart';
import 'package:fragrance/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //bottomnavbar
  int _index = 0;
  final List<Widget> _children = [home_page(),search_page(),collections_page(), profile_page()];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        child: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (index) => setState(() => this._index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home", selectedIcon: Icon(Icons.home),),
            NavigationDestination(icon: Icon(Icons.search), label: "Search", selectedIcon: Icon(Icons.search_sharp),),
            NavigationDestination(icon: Icon(Icons.collections_bookmark_outlined,), label: "Collections", selectedIcon: Icon(Icons.collections_bookmark_rounded),),
            NavigationDestination(icon: Icon(Icons.account_box_outlined), label: "Profile", selectedIcon: Icon(Icons.account_box,),),
          ],
        ),
      ),
    );
  }
}
