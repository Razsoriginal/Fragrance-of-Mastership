import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/services/settings/provider/settings_provider.dart';
import '../../../../models/appdata/articles/article_model.dart';

class ArticlePageContent extends StatelessWidget {
  const ArticlePageContent({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8)),
            child: Text(
              'Published on ${article.date.toLocal().toLocal().toString().split(' ')[0]}',
              style: const TextStyle(
                color: fSecondaryColor,
              ),
            ),
          ),
          Consumer<SettingsProvider>(
              builder: (context, settingsProvider, child) {
            final settings = settingsProvider.settings;
            double engSize = settings?.translationSize ?? 20;

            return Html(
              data: "<div>${article.content}</div>",
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
