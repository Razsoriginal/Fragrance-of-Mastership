import 'package:hive/hive.dart';

part 'insights_model.g.dart';

@HiveType(typeId: 7)
class InsightModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<String> categories;

  @HiveField(3)
  List<String> tags;

  @HiveField(4)
  String description;

  @HiveField(5)
  String content;

  InsightModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.categories,
      required this.description,
      required this.tags});

  factory InsightModel.fromMap(Map<String, dynamic> map) {
    return InsightModel(
      id: map['id'],
      title: map['title'],
      categories: map['categories'],
      tags: map['tags'],
      description: map['description'],
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'categories': categories,
      'description': description,
      'content': content,
    };
  }
}
