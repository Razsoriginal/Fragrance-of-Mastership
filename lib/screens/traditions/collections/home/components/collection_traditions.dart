import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../controllers/services/traditions/collections/get_tradition_from_collection.dart';
import '../../../../../controllers/services/traditions/collections/provider/collection_provider.dart';
import '../../../components/tradition_title.dart';

class TraditionsInCollection extends StatelessWidget {
  const TraditionsInCollection({
    Key? key,
    required this.collectionIndex,
    required this.collectionName,
  }) : super(key: key);

  final int collectionIndex;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    final collectionProvider =
        Provider.of<CollectionServiceProvider>(context, listen: false);

    final filteredTraditions =
        GetTraditionsFromCollection.getFilteredTraditions(
      context: context,
      collectionProvider: collectionProvider,
      collectionIndex: collectionIndex,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredTraditions.length,
            itemBuilder: (context, index) {
              return TraditionTitle(
                traditionNumber: filteredTraditions[index]["id"],
                title: filteredTraditions[index]["title"],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
