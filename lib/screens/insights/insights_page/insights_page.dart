import 'package:flutter/material.dart';

import '../../../models/appdata/insights/insights_model.dart';
import 'components/body.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key, required this.insight});

  final InsightModel insight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        insight: insight,
      ),
    );
  }
}
