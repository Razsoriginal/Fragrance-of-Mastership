import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/models/appdata/insights/insights_model.dart';

import '../../../../constants/sizes.dart';
import 'insight_page_content.dart';
import 'insight_page_header.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.insight});

  final InsightModel insight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InsightPageHeader(insight: insight),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          InsightPageContent(insight: insight),
          // recommended insights
        ],
      ),
    );
  }
}
