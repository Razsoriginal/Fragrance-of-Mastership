import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/traditions/hadith_page/components/previous_next_hadith.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/tradition_data_service.dart';
import 'hadith_page_content.dart';
import 'hadith_page_header.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.index});

  final int index;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String title;
  late String arabic;
  late String english;
  late List<String> references;
  late List<String> notes;
  late TraditionProvider traditionProvider;

  late String preTitle;
  late String nextTitle;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    traditionProvider = Provider.of<TraditionProvider>(context, listen: false);
    try {
      dynamic tradition = traditionProvider.getTraditionAtIndex(widget.index);
      title = tradition["title"] + ".";
      arabic = tradition["arabic"];
      english = tradition["english"];
      references = List<String>.from(tradition["references"]);
      notes = List<String>.from(tradition["notes"]);

      if (widget.index > 0) {
        dynamic tradition2 =
            traditionProvider.getTraditionAtIndex(widget.index - 1);
        preTitle = tradition2?["title"];
      } else {
        preTitle = "";
      }

      if (widget.index < 308) {
        dynamic tradition3 =
            traditionProvider.getTraditionAtIndex(widget.index + 1);
        nextTitle = tradition3["title"];
      } else {
        nextTitle = "";
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HadithPageHeader(
            title: title,
            arabic: arabic,
            english: english,
            references: references,
            notes: notes,
            index: widget.index,
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          HadithPageContent(
            arabic: arabic,
            english: english,
            notes: notes,
            references: references,
            index: widget.index,
          ),
          PreviousNextHadith(
            preTitle: preTitle,
            nextTitle: nextTitle,
            index: widget.index,
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
        ],
      ),
    );
  }
}
