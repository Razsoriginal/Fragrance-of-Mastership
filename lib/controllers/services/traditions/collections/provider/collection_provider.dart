import 'package:flutter/material.dart';

import '../../../../../models/appdata/traditions/collection_model.dart';
import '../collections_service.dart';

class CollectionServiceProvider with ChangeNotifier {
  late CollectionService _collectionService;
  List<Collection> _collections = [];

  CollectionServiceProvider() {
    _collectionService = CollectionService();
    _init();
  }

  Future<void> _init() async {
    await _collectionService.init();
    _collections = await _collectionService.getAllCollections();
    notifyListeners();
  }

  List<Collection> get collections => _collections;

  Future<void> addCollection(Collection collection) async {
    await _collectionService.addCollection(collection);
    _collections.add(collection);
    notifyListeners();
  }

  Future<void> updateCollectionName(int collectionIndex, String newName) async {
    final collection = _collections[collectionIndex];
    collection.name = newName;
    await _collectionService.updateCollection(collectionIndex, collection);
    notifyListeners();
  }

  Future<void> updateCollection(int collectionIndex, String newName,
      List<int> newTraditionIndices) async {
    final collection = _collections[collectionIndex];
    collection.name = newName;
    collection.traditionIndices = newTraditionIndices;
    await _collectionService.updateCollection(collectionIndex, collection);
    notifyListeners();
  }

  Future<void> removeCollection(int index) async {
    final collectionToRemove = _collections[index];
    await _collectionService.deleteCollection(index);
    _collections.removeWhere((collection) => collection == collectionToRemove);
    notifyListeners();
  }

  Future<void> removeAllCollection() async {
    _collections.clear();
    notifyListeners();
  }

  Future<void> removeTraditionIndexFromCollection(
      int collectionIndex, int traditionIndex) async {
    final collection = _collections[collectionIndex];
    collection.traditionIndices.remove(traditionIndex);
    await _collectionService.updateCollection(collectionIndex, collection);
    notifyListeners();
  }

  Future<void> addTraditionIndexToCollection(
      int collectionIndex, int traditionIndex) async {
    final collection = _collections[collectionIndex];
    collection.traditionIndices.add(traditionIndex);
    await _collectionService.updateCollection(collectionIndex, collection);
    notifyListeners();
  }

  bool doesCollectionExistWithName(String name) {
    return _collections.any((collection) => collection.name == name);
  }
}
