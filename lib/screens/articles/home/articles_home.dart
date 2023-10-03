import 'package:flutter/material.dart';

import 'components/body.dart';

class ArticlesHome extends StatelessWidget {
  const ArticlesHome({super.key, this.tabName = ''});

  final String tabName;

  static String routeName = "/articlesHome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(
        tabName: tabName,
      ),
    );
  }
}
