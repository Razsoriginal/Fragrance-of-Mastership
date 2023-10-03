import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/controllers/services/articles/provider/articles_provider.dart';
import 'package:provider/provider.dart';

import '../../../../models/appdata/articles/article_model.dart';
import 'article_page_content.dart';
import 'article_page_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
    final articles = articleProvider.articles;

    // Find the article with the specified id
    final article = articles.firstWhere(
      (article) => article.id.toString() == id,
      orElse: () => Article(
        id: "0",
        title: 'Not Found',
        date: DateTime.now(),
        categories: [],
        tags: [],
        description: 'Article not found',
        content: 'The requested article was not found.',
        image: '',
      ),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticlePageHeader(article: article),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          ArticlePageContent(article: article),
          // recommended articles
        ],
      ),
    );
  }
}
/*

class Body2 extends StatelessWidget {
  const Body2({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);
    final articles = articleProvider.articles;

    // Find the article with the specified id
    final article = articles.firstWhere(
      (article) => article.id.toString() == id,
      orElse: () => Article(
        id: "0",
        title: 'Not Found',
        date: DateTime.now(),
        categories: [],
        tags: [],
        description: 'Article not found',
        content: 'The requested article was not found.',
        image: '',
      ),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the article title
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              article.title,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(24),
                fontWeight: FontWeight.bold,
                color: fSecondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Published on ${article.date.toLocal().toLocal().toString().split(' ')[0]}',
              style: const TextStyle(
                color: fSecondaryColor, // Date color
              ),
            ),
          ),
          // Display the article description
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              article.description,
              style: const TextStyle(
                fontSize: 18,
                color: fTextColor, // Description color
              ),
            ),
          ),
          // Display the article content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              article.content,
              style: const TextStyle(
                fontSize: 16,
                color: fTextColor, // Content color
              ),
            ),
          ),
          // Display the article image if it exists
          if (article.image.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                article.image,
                width: double.infinity, // Adjust width as needed
                fit: BoxFit.cover, // Adjust image fit as needed
              ),
            ),
          // Display categories
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Categories: ${article.categories.join(', ')}',
              style: const TextStyle(
                fontSize: 16,
                color: fPrimaryColor, // Categories color
              ),
            ),
          ),
          // Display tags
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Tags: ${article.tags.join(', ')}',
              style: const TextStyle(
                fontSize: 16,
                color: fSecondaryColor, // Tags color
              ),
            ),
          ),
          // You can add more fields here as needed
        ],
      ),
    );
  }
}
*/
