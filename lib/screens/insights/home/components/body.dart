import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/insights/home/components/qna_list.dart';

import '../../../../components/home_header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [
        HomeHeader(
          title: 'Insights',
        ),
        SizedBox(
          height: 10,
        ),
        QnaList(),
      ]),
    );
  }
}
