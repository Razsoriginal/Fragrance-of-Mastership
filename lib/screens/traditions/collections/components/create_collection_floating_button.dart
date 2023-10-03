import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/components/create_collection.dart';

class CreateCollectionFloatingButton extends StatelessWidget {
  const CreateCollectionFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateCollection(),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
