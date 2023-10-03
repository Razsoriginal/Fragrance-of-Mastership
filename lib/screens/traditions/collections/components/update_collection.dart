import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/default_button.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/collections/get_tradition_from_collection.dart';
import '../../../../controllers/services/traditions/collections/provider/collection_provider.dart';

class UpdateCollection extends StatefulWidget {
  const UpdateCollection(
      {Key? key, required this.collectionIndex, required this.title})
      : super(key: key);

  final int collectionIndex;
  final String title;

  @override
  State<UpdateCollection> createState() => _UpdateCollectionState();
}

class _UpdateCollectionState extends State<UpdateCollection> {
  final TextEditingController nameController = TextEditingController();
  final List<int> removedTraditionIndices = [];

  @override
  void initState() {
    super.initState();
    nameController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final collectionProvider =
        Provider.of<CollectionServiceProvider>(context, listen: false);

    final filteredTraditions =
        GetTraditionsFromCollection.getFilteredTraditions(
      context: context,
      collectionProvider: collectionProvider,
      collectionIndex: widget.collectionIndex,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Collection"),
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
                decoration: const InputDecoration(labelText: 'Collection Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<CollectionServiceProvider>(
                builder: (context, collectionProvider, _) {
                  return Column(
                    children: [
                      DefaultButton(
                        text: "Save",
                        press: () async {
                          final newName = nameController.text;

                          if (newName.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please add a name for the collection'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            return;
                          }

                          final updatedTraditionIndices = filteredTraditions
                              .asMap()
                              .keys
                              .toList()
                            ..removeWhere((index) =>
                                removedTraditionIndices.contains(index));

                          collectionProvider.updateCollection(
                            widget.collectionIndex,
                            newName,
                            updatedTraditionIndices,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Collection updated'),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredTraditions.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredTraditions[index]["title"]),
                            trailing: Checkbox(
                              value: !removedTraditionIndices.contains(index),
                              // inverted because Checkbox is used for unchecking
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue!) {
                                    removedTraditionIndices.remove(index);
                                  } else {
                                    removedTraditionIndices.add(index);
                                  }
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ],
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
