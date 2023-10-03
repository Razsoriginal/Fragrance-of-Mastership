import 'package:hive/hive.dart';

class HiveServiceBase<T> {
  late Box<T> _box;

  Future<void> initBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox<T>(boxName);
    } else {
      _box = Hive.box<T>(boxName);
    }
  }

  Box<T> get box => _box;
}
