import 'package:hive/hive.dart';

part 'article_model.g.dart';

@HiveType(typeId: 6)
class Article {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  List<String> categories;

  @HiveField(4)
  List<String> tags;

  @HiveField(5)
  String description;

  @HiveField(6)
  String content;

  @HiveField(7)
  String image;

  Article(
      {required this.id,
      required this.title,
      required this.content,
      required this.categories,
      required this.date,
      required this.description,
      required this.image,
      required this.tags});

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      categories: map['categories'],
      tags: map['tags'],
      description: map['description'],
      content: map['content'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'categories': categories,
      'description': description,
      'content': content,
      'image': image,
    };
  }
}
