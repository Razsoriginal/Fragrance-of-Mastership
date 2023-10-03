import 'package:hive/hive.dart';

part 'collection_model.g.dart';

@HiveType(typeId: 2)
class Collection {
  @HiveField(0)
  String name;

  @HiveField(1)
  List traditionIndices;

  Collection(this.name, this.traditionIndices);
}
