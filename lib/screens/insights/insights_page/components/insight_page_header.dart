import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/image_strings.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/insights/share_insights.dart';
import '../../../../models/appdata/insights/insights_model.dart';
import '../../../profile/setting/app_settings/app_settings.dart';

class InsightPageHeader extends StatefulWidget {
  const InsightPageHeader({
    super.key,
    required this.insight,
  });

  final InsightModel insight;

  @override
  State<InsightPageHeader> createState() => _InsightPageHeaderState();
}

class _InsightPageHeaderState extends State<InsightPageHeader> {
  late ShareInsights insight;

  Future<void> handleClick(String value) async {
    switch (value) {
      case 'Share':
        shareInsight();
        insight.share(context);
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppSettings(),
          ),
        );
        break;
    }
  }

  void shareInsight() {
    insight = ShareInsights(
      title: widget.insight.title,
      description: widget.insight.description,
      content: widget.insight.content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        image: DecorationImage(
          image: AssetImage(fImageHeader),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_add_outlined),
                    ),
                    buildPopupMenuButton(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: getProportionateScreenWidth(20),
              ),
              child: Text(
                widget.insight.title,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Share', 'Settings'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
