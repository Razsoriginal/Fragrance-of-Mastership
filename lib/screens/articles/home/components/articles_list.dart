import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/controllers/services/articles/provider/articles_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import 'article_list.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Consumer<ArticleProvider>(
        builder: (context, articleProvider, _) {
          var articles = articleProvider.articles;

          if (category.isNotEmpty) {
            articles = articles.where((article) {
              return article.categories.contains(category);
            }).toList();
          }

          if (articles.isEmpty) {
            articleProvider.refreshArticles();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              shrinkWrap: false,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ArticleTitle(
                      articles: articles,
                      index: index,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
