import 'package:flutter/material.dart';
import 'components/body.dart';

class TraditionScreen extends StatelessWidget {
  const TraditionScreen({super.key});
  static String routeName = "/tradition_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}