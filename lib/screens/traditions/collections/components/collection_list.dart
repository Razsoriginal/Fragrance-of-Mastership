import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/components/update_collection.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/home/components/collection_traditions.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/collections/provider/collection_provider.dart';

class CollectionListWidget extends StatefulWidget {
  const CollectionListWidget({super.key, required this.isHome, this.index});

  final bool isHome;
  final int? index;

  @override
  State<CollectionListWidget> createState() => _CollectionListWidgetState();
}

class _CollectionListWidgetState extends State<CollectionListWidget> {
  late String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionServiceProvider>(
      builder: (context, collectionProvider, _) {
        final collections = collectionProvider.collections;

        return collections.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(100),
                      ),
                      Text(
                        'Start by creating your first collection!',
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(15)),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: ListView.separated(
                  itemCount: collections.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final collection = collections[index];
                    return ListTile(
                      trailing: buildPopupMenuButton(
                          index, collection.name, collectionProvider),
                      leading: const Icon(Icons.menu),
                      title: Text(collection.name),
                      subtitle: Text(
                        '${collection.traditionIndices.length} Traditions',
                        style: const TextStyle(color: fPrimaryColor),
                      ),
                      onTap: () {
                        if (widget.isHome) {
                          _collectionsPage(index, collection.name);
                        } else {
                          _addTraditionToCollection(index, (widget.index! + 1));
                        }
                      },
                    );
                  },
                ),
              );
      },
    );
  }

  Future<void> _collectionsPage(int index, String title) async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TraditionsInCollection(
              collectionIndex: index,
              collectionName: title,
            )));
  }

  Future<void> _addTraditionToCollection(
      int collectionIndex, int traditionIndex) async {
    final collectionProvider =
        Provider.of<CollectionServiceProvider>(context, listen: false);
    final collection = collectionProvider.collections[collectionIndex];

    // Check if the tradition index is already in the collection
    if (collection.traditionIndices.contains(traditionIndex)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This tradition is already in the collection'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      collectionProvider.addTraditionIndexToCollection(
          collectionIndex, traditionIndex);

      // Show Snackbar for success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tradition added to the collection'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context);
    }
  }

  PopupMenuButton<String> buildPopupMenuButton(int index, String title,
      CollectionServiceProvider collectionServiceProvider) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        handleClick(index, title, value, collectionServiceProvider);
      },
      itemBuilder: (BuildContext context) {
        return {'Edit', 'Delete'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  void handleClick(int index, String title, String value,
      CollectionServiceProvider collectionServiceProvider) {
    switch (value) {
      case 'Edit':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                UpdateCollection(collectionIndex: index, title: title)));
        break;
      case 'Delete':
        collectionServiceProvider.removeCollection(index);
        break;
    }
  }
}
