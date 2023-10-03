import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/image_strings.dart';
import 'package:fragrance_of_mastership/controllers/services/traditions/notes/provider/notes_provider.dart';
import 'package:fragrance_of_mastership/controllers/services/traditions/shareTradition.dart';
import 'package:fragrance_of_mastership/screens/profile/setting/app_settings/app_settings.dart';

import '../../../../constants/sizes.dart';

class HadithPageHeader extends StatefulWidget {
  const HadithPageHeader({
    super.key,
    required this.title,
    required this.arabic,
    required this.english,
    required this.references,
    required this.notes,
    required this.index,
  });

  final String title;
  final String arabic;
  final String english;
  final List<String> references;
  final List<String> notes;
  final int index;

  @override
  State<HadithPageHeader> createState() => _HadithPageHeaderState();
}

class _HadithPageHeaderState extends State<HadithPageHeader> {
  late ShareTradition tradition;
  String? personalNote;

  void shareTradition() {
    final noteProvider = NoteProvider();
    final note = noteProvider.get(widget.index);
    if (note != null) {
      setState(() {
        personalNote = note.content;
      });
    }

    tradition = ShareTradition(
      title: widget.title,
      arabic: widget.arabic,
      eng: widget.english,
      refEng: widget.references,
      note: widget.notes,
      userNotes: personalNote,
    );
  }

  Future<void> handleClick(String value) async {
    switch (value) {
      case 'Share':
        shareTradition();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return tradition;
            });
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppSettings(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        image: DecorationImage(
          image: AssetImage(fImageHeader),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
                buildPopupMenuButton(),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: getProportionateScreenWidth(20),
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Share', 'Settings'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
