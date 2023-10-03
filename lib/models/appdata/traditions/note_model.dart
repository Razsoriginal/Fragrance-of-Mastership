import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  int id;

  @HiveField(1)
  String content;

  Note({
    required this.id,
    required this.content,
  });
}
