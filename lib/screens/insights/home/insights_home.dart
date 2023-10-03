import 'package:flutter/material.dart';

import 'components/body.dart';

class InsightsHome extends StatelessWidget {
  const InsightsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
    );
  }
}
