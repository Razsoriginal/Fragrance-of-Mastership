import 'package:flutter/material.dart';

import 'components/body.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notes)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.collections_bookmark_outlined)),
        ],
      ),
      body: const Body(),
    );
  }
}
