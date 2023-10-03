import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/home/collections_screen.dart';

import 'components/body.dart';

class TraditionsScreen extends StatelessWidget {
  const TraditionsScreen({super.key});

  static String routeName = "/traditions_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notes)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CollectionsScreen()));
              },
              icon: const Icon(Icons.collections_bookmark_outlined)),
        ],
      ),
      body: const Body(),
    );
  }
}
