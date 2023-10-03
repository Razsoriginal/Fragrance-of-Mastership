import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/colors.dart';
import 'package:fragrance_of_mastership/screens/articles/article_page/article_page.dart';

import '../../../../constants/sizes.dart';
import '../../../../models/appdata/articles/article_model.dart';

class ArticleTitle extends StatelessWidget {
  const ArticleTitle({
    super.key,
    required this.articles,
    required this.index,
  });

  final int index;
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlePage(id: articles[index].id))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index + 1}. ${articles[index].title}",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(17),
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "In ${articles[index].tags.join(" / ")}",
                style: const TextStyle(color: fPrimaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                articles[index].description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(15),
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
      ],
    );
  }
}
