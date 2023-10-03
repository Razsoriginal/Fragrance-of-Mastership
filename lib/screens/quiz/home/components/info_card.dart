import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: fBgColor,
      ),
      child: Text(text),
    );
  }
}
