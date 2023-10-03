import 'package:hive/hive.dart';

part 'bookmark_articles_model.g.dart';

@HiveType(typeId: 3)
class BookMarkArticle {
  @HiveField(0)
  int id; // Article identifier

  BookMarkArticle(this.id);
}
