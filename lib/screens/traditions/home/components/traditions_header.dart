import 'package:flutter/material.dart';

import '../../../../components/home_header.dart';

class TraditionsHeader extends StatefulWidget {
  const TraditionsHeader({super.key});

  @override
  State<TraditionsHeader> createState() => _TraditionsHeaderState();
}

class _TraditionsHeaderState extends State<TraditionsHeader> {
  @override
  Widget build(BuildContext context) {
    return const HomeHeader(
      title: 'Fragrance',
    );
  }
}
