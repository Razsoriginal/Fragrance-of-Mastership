import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/components/create_collection_floating_button.dart';

import '../components/collection_list.dart';

class AddCollections extends StatelessWidget {
  const AddCollections({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collections"),
      ),
      body: CollectionListWidget(
        isHome: false,
        index: index,
      ),
      floatingActionButton: const CreateCollectionFloatingButton(),
    );
  }
}
