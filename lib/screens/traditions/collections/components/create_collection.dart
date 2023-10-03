import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/default_button.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/collections/provider/collection_provider.dart';
import '../../../../models/appdata/traditions/collection_model.dart';

class CreateCollection extends StatelessWidget {
  CreateCollection({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Collection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Collection Name'),
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<CollectionServiceProvider>(
                builder: (context, collectionProvider, _) {
                  return DefaultButton(
                    text: "Create",
                    press: () async {
                      final newName = nameController.text;

                      if (newName.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please add a name for the collection'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      if (collectionProvider
                          .doesCollectionExistWithName(newName)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'A collection with the same name already exists'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      final newCollection = Collection(
                        newName,
                        [], // Provide the filteredTraditions list here
                      );

                      collectionProvider.addCollection(newCollection);

                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
