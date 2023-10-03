import 'package:flutter/material.dart';

import 'components/body.dart';

class NotificationsHome extends StatelessWidget {
  const NotificationsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
    );
  }
}
