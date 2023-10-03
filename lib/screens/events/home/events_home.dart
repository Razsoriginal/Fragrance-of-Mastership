import 'package:flutter/material.dart';

import 'components/body.dart';

class EventsHome extends StatelessWidget {
  const EventsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
    );
  }
}
