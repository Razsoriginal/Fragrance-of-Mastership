import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/components/collection_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const CollectionListWidget(
      isHome: true,
    );
  }
}
