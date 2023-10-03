import 'package:fragrance_of_mastership/models/appdata/articles/bookmark_articles_model.dart';

import '../../hive_service_base.dart';

class ArticleBookmarkService extends HiveServiceBase<BookMarkArticle> {
  Future<void> init() async {
    await initBox('articles');
  }

  Future<void> addArticle(BookMarkArticle article) async {
    await box.add(article);
  }

  Future<BookMarkArticle?> getArticle(int id) async {
    return box.get(id);
  }

  Future<void> deleteArticle(int id) async {
    await box.delete(id);
  }
}
