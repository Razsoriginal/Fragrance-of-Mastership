import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/constants.dart';
import '../../../models/appdata/articles/article_model.dart';
import '../hive_service_base.dart';

class ArticleService {
  final String _apiBaseUrl = fApiBaseUrl;
  final HiveServiceBase<Article> _hiveService = HiveServiceBase<Article>();
  final String _boxName = 'articles';

  Future<void> init() async {
    await _hiveService.initBox(_boxName);
  }

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await http.get(Uri.parse('$_apiBaseUrl/article'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> articleDataList = jsonDecode(response.body);

        final articles = articleDataList.map((articleData) {
          try {
            final id = articleData['_id'] ?? "0";
            final title = articleData['title'] ?? '';
            final dateStr = articleData['date'] as String?;

            final date =
                dateStr != null ? DateTime.parse(dateStr) : DateTime.now();

            final categories =
                (articleData['categories'] as List<dynamic>).cast<String>();

            final tags = (articleData['tags'] as List<dynamic>).cast<String>();

            final description = articleData['description'] ?? '';
            final content = articleData['content'] ?? '';
            final image = articleData['image'] ?? '';

            return Article(
              id: id,
              title: title,
              date: date,
              categories: categories,
              tags: tags,
              description: description,
              content: content,
              image: image,
            );
          } catch (e) {
            print('Error mapping article data: $e');
            return Article(
              id: "0",
              title: 'Error',
              date: DateTime.now(),
              categories: [],
              tags: [],
              description: 'Error mapping article data',
              content: '',
              image: '',
            );
          }
        }).toList();

        await _saveArticlesInHive(articles);

        return articles;
      } else {
        print("Failed to fetch articles");
        throw Exception('Failed to fetch articles');
      }
    } catch (e) {
      print('Error fetching articles: $e');
      return getSavedArticlesFromHive();
    }
  }

  Future<void> _saveArticlesInHive(List<Article> articles) async {
    await _hiveService.box.clear();
    final limitedArticles = articles.take(10).toList();
    for (final article in limitedArticles) {
      _hiveService.box.put(article.id, article);
    }
  }

  Future<List<Article>> getSavedArticlesFromHive() async {
    final List<Article> articles = _hiveService.box.values.toList();
    /*for (var i = 0; i < 10; i++) {
      final Article? article = _hiveService.box.getAt(i);
      if (article != null) {
        articles.add(article);
      }
    }*/
    return articles;
  }
}
