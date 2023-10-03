import 'package:flutter/material.dart';

import 'components/body.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id: id),
    );
  }
}
