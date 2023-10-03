import 'package:flutter/material.dart';
import '../../constants/sizes.dart';
import 'home_page/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: TraditionScreen(),
    );
  }
}