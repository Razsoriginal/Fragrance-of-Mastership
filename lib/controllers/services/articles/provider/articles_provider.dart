import 'package:flutter/foundation.dart';

import '../../../../models/appdata/articles/article_model.dart';
import '../article_service.dart';

class ArticleProvider extends ChangeNotifier {
  late final ArticleService _articleService;

  ArticleProvider() {
    _articleService = ArticleService();
    init();
  }

  List<Article> _articles = [];

  Future<void> init() async {
    await _articleService.init();
    _articles = await _articleService.fetchArticles();
    notifyListeners();
  }

  List<Article> get articles => _articles;

  Future<void> refreshArticles() async {
    _articles = await _articleService.fetchArticles();
    notifyListeners();
  }
}
