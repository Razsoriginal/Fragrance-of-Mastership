import 'package:flutter/material.dart';

import 'components/body.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(
          id: id,
          ),
    );
  }
}
