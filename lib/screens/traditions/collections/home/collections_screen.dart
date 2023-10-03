import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/components/create_collection_floating_button.dart';

import 'components/body.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
      floatingActionButton: const CreateCollectionFloatingButton(),
    );
  }
}
