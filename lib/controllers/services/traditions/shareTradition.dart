import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/colors.dart';
import 'package:share_plus/share_plus.dart';

class ShareTradition extends StatefulWidget {
  final String title;
  final String arabic;
  final String eng;
  final List<String> refEng;
  final List<String>? note;
  final String? userNotes;

  const ShareTradition({
    super.key,
    required this.title,
    required this.arabic,
    required this.eng,
    required this.refEng,
    this.note,
    this.userNotes,
  });

  @override
  State<ShareTradition> createState() => _ShareTraditionState();
}

class _ShareTraditionState extends State<ShareTradition> {
  String removeHtmlTags(String htmlString) {
    return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  List<String> contentOptions = [
    'Arabic',
    'English Translation',
    'Reference Eng',
    'Notes',
    'Your Notes',
  ];

  bool _count = false;

  List<String> result = [];
  List<String> textsToShare = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: fPrimaryLightColor,
      /*titleTextStyle: TextStyle(
        color: fPrimaryColor,
        fontSize: getProportionateScreenHeight(24),
      ),*/
      title: const Text('Share what?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: contentOptions.map((contentOption) {
            return CheckboxListTile(
              activeColor: fPrimaryColor.withOpacity(0.8),
              title: Text(contentOption),
              value: result.contains(contentOption),
              onChanged: (bool? value) {
                if (value == true) {
                  if (!result.contains(contentOption)) {
                    result.add(contentOption);
                  }
                } else {
                  result.remove(contentOption);
                }
                setState(() {});
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            'Share',
            style: TextStyle(color: fPrimaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop(result);
            List<String> selectedOptions = result;
            _count = true;
            if (_count) {
              textsToShare.add(widget.title);
            }
            if (selectedOptions.contains('Arabic')) {
              textsToShare.add(widget.arabic);
            }
            if (selectedOptions.contains('English Translation')) {
              textsToShare.add(removeHtmlTags(widget.eng));
            }
            if (selectedOptions.contains('Notes')) {
              textsToShare.add(removeHtmlTags(widget.note!.join('\n')));
            }
            if (selectedOptions.contains('Reference Eng')) {
              if (widget.userNotes != null) {
                textsToShare.add(widget.userNotes ?? "");
              }
            }
            if (selectedOptions.contains('Reference Eng')) {
              textsToShare.add(widget.refEng.join('\n'));
            }

            if (_count) {
              textsToShare.add("Shared via Fragrance of Mastership");
            }

            String textToShare = textsToShare.join('\n\n');

            try {
              Share.share(textToShare);
            } catch (e) {
              print("Error While Sharing Tradition; $e");
            }
          },
        ),
      ],
    );
  }
}
