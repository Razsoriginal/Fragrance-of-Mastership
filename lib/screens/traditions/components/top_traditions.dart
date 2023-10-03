import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/sizes.dart';
import '../../../controllers/services/traditions/tradition_data_service.dart';
import 'tradition_title.dart';

class TopTraditions extends StatelessWidget {
  const TopTraditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Consumer<TraditionProvider>(
        builder: (context, traditionProvider, _) {
          if (traditionProvider.traditions.isEmpty) {
            traditionProvider.fetchData();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var topTraditions = traditionProvider.getTopTraditions(5);
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: topTraditions.length,
              itemBuilder: (context, index) {
                return TraditionTitle(
                  traditionNumber: topTraditions[index]["id"],
                  title: topTraditions[index]["title"],
                  index: topTraditions[index]['id'] - 1,
                );
              },
            );
          }
        },
      ),
    );
  }
}
