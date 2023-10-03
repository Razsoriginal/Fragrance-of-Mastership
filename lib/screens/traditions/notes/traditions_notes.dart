import 'package:flutter/material.dart';

import 'components/body.dart';

class TraditionNote extends StatelessWidget {
  const TraditionNote({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Body(index: index),
    );
  }
}
