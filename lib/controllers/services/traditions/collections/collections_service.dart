import '../../../../models/appdata/traditions/collection_model.dart';
import '../../hive_service_base.dart';

class CollectionService extends HiveServiceBase<Collection> {
  Future<void> init() async {
    await initBox('collections');
  }

  Future<void> addCollection(Collection collection) async {
    await box.add(collection);
  }

  Future<Collection?> getCollection(int id) async {
    return box.get(id);
  }

  Future<List<Collection>> getAllCollections() async {
    return box.values.toList();
  }

  Future<void> updateCollection(int id, Collection updatedCollection) async {
    await box.putAt(id, updatedCollection);
  }

  Future<void> deleteCollection(int id) async {
    await box.delete(id);
  }

  Future<void> deleteAllCollection() async {
    await box.clear();
  }
}
