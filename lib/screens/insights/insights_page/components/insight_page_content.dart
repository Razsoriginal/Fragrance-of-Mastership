import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fragrance_of_mastership/models/appdata/insights/insights_model.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/settings/provider/settings_provider.dart';

class InsightPageContent extends StatelessWidget {
  const InsightPageContent({
    super.key,
    required this.insight,
  });

  final InsightModel insight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<SettingsProvider>(
              builder: (context, settingsProvider, child) {
            final settings = settingsProvider.settings;
            double engSize = settings?.translationSize ?? 20;

            return Html(
              data: "<div>${insight.content}</div>",
              style: {
                'div': Style(
                  fontSize: FontSize(engSize),
                ),
              },
            );
          }),
        ],
      ),
    );
  }
}
