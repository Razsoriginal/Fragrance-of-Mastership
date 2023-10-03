import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/controllers/services/traditions/collections/provider/collection_provider.dart';
import 'package:provider/provider.dart';

import '../tradition_data_service.dart';

class GetTraditionsFromCollection {
  static List getFilteredTraditions({
    required BuildContext context,
    required CollectionServiceProvider collectionProvider,
    required int collectionIndex,
  }) {
    final traditionProvider = context.read<TraditionProvider>();
    final filteredTraditions = traditionProvider.traditions
        .where((tradition) => collectionProvider
            .collections[collectionIndex].traditionIndices
            .contains(tradition["id"]))
        .toList();
    return filteredTraditions;
  }
}
