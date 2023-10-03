import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/image_strings.dart';
import 'package:fragrance_of_mastership/controllers/services/articles/share_articles.dart';

import '../../../../constants/sizes.dart';
import '../../../../models/appdata/articles/article_model.dart';
import '../../../profile/setting/app_settings/app_settings.dart';

class ArticlePageHeader extends StatefulWidget {
  const ArticlePageHeader({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<ArticlePageHeader> createState() => _ArticlePageHeaderState();
}

class _ArticlePageHeaderState extends State<ArticlePageHeader> {
  late ShareArticle article;

  Future<void> handleClick(String value) async {
    switch (value) {
      case 'Share':
        shareArticle();
        article.share(context);
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

  void shareArticle() {
    article = ShareArticle(
      title: widget.article.title,
      description: widget.article.description,
      content: widget.article.content,
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
                widget.article.title,
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
