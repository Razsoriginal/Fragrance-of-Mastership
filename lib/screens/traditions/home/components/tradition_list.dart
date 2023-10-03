import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/components/tradition_title.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/tradition_data_service.dart';

class TraditionList extends StatefulWidget {
  const TraditionList({Key? key, required this.volume}) : super(key: key);

  final int volume;

  @override
  State<TraditionList> createState() => _TraditionListState();
}

class _TraditionListState extends State<TraditionList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<TraditionProvider>(context, listen: false).nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Consumer<TraditionProvider>(
        builder: (context, traditionProvider, _) {
          var traditions =
              traditionProvider.getTraditionsByVolume(widget.volume);
          if (traditions.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: traditions.length,
              itemBuilder: (context, index) {
                return TraditionTitle(
                  traditionNumber: traditions[index]["id"],
                  title: traditions[index]["title"],
                  index: traditions[index]['id'] - 1,
                );
              },
            );
          }
        },
      ),
    );
  }
}
