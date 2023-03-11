
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
/*
class ShareTradition {
  String title;
  String hadithBy;
  String arabic;
  String eng;
  String urdu;// 1 for only eng, 2 for urdu, 3 for eng + urdu
  String description;
  List<String> refEng;
  List<String> refUrdu;

  bool _count = false;

  ShareTradition({
    required this.title,
    required this.hadithBy,
    required this.arabic,
    required this.eng,
    required this.urdu,
    required this.description,
    required this.refEng,
    required this.refUrdu,
  });


  Future<List<String>> askForContent(BuildContext context) async {
    // Define a list of content options to show to the user
    List<String> contentOptions = [
      'Description',
      'Arabic',
      'English Translation',
      'Urdu Translation',
      'Refrence Eng',
      'Refrence Urdu',
    ];

    // Show a dialog to the user to choose the content to share
    List<String>? selectedValues = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        List<String> result = [];
        return AlertDialog(
          title: Text('Share what?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: contentOptions.map((contentOption) {
                return CheckboxListTile(
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
                    print(result);
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Share'),
              onPressed: () {
                Navigator.of(context).pop(result);
                _count = true;
              },
            ),
          ],
        );
      },
    );

    // Join the selected texts with a line break
    return selectedValues ?? [];
  }



  Future<void> share(BuildContext context) async {
    // Ask the user what content to share
    List<String> selectedOptions = await askForContent(context);

    // Prepare the text to share based on the user's choice
    List<String> textsToShare = [];

    if (_count) {
      textsToShare.add(title);
    }
    if (selectedOptions.contains('Description')) {
      textsToShare.add(description);
    }
    if (selectedOptions.contains('DadithBy')) {
      textsToShare.add(hadithBy);
    }
    if (selectedOptions.contains('Arabic')) {
      textsToShare.add(arabic);
    }
    if (selectedOptions.contains('English Translation')) {
      textsToShare.add(eng);
    }
    if (selectedOptions.contains('Urdu Translation')) {
      textsToShare.add(urdu);
    }
    if (selectedOptions.contains('Refrence Eng')) {
      textsToShare.add(refEng.join('\n'));
    }
    if (selectedOptions.contains('Refrence Urdu')) {
      textsToShare.add(refUrdu.join('\n'));
    }

    if (_count) {textsToShare.add("Shared via Fragrance of Mastership");}

    // Join the selected texts with a line break
    String textToShare = textsToShare.join('\n\n');

    // Share the text to other apps using the share system intent
    try {
      await Share.share(textToShare);
      print("Content Shared");
    } catch (e) {
      // Handle any errors that occur while sharing
      print('Error sharing: $e');
    }
  }
}*/

class ShareTradition extends StatefulWidget {
  String title;
  String hadithBy;
  String arabic;
  String eng;
  String urdu;// 1 for only eng, 2 for urdu, 3 for eng + urdu
  String description;
  List<String> refEng;
  List<String> refUrdu;

  ShareTradition({required this.title,
    required this.hadithBy,
    required this.arabic,
    required this.eng,
    required this.urdu,
    required this.description,
    required this.refEng,
    required this.refUrdu,});

  @override
  State<ShareTradition> createState() => _ShareTraditionState();
}

class _ShareTraditionState extends State<ShareTradition> {

  List<String> contentOptions = [
    'Description',
    'Arabic',
    'English Translation',
    'Urdu Translation',
    'Refrence Eng',
    'Refrence Urdu',
  ];

  bool _count = false;

  List<String> result = [];
  List<String> textsToShare = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Share what?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: contentOptions.map((contentOption) {
            return CheckboxListTile(
              title: Text(contentOption),
              value: result.contains(contentOption),
              onChanged: (bool? value) {
                if (value == true) {
                  if (!result.contains(contentOption)) {result.add(contentOption);}
                } else {result.remove(contentOption);}
                setState(() {});
                print(result);
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Share'),
          onPressed: () {
            Navigator.of(context).pop(result);
            List<String> selectedOptions = result;
            _count = true;
            if (_count) {
              textsToShare.add(widget.title);
            }
            if (selectedOptions.contains('Description')) {
              textsToShare.add(widget.description);
            }
            if (selectedOptions.contains('DadithBy')) {
              textsToShare.add(widget.hadithBy);
            }
            if (selectedOptions.contains('Arabic')) {
              textsToShare.add(widget.arabic);
            }
            if (selectedOptions.contains('English Translation')) {
              textsToShare.add(widget.eng);
            }
            if (selectedOptions.contains('Urdu Translation')) {
              textsToShare.add(widget.urdu);
            }
            if (selectedOptions.contains('Refrence Eng')) {
              textsToShare.add(widget.refEng.join('\n'));
            }
            if (selectedOptions.contains('Refrence Urdu')) {
              textsToShare.add(widget.refUrdu.join('\n'));
            }

            if (_count) {textsToShare.add("Shared via Fragrance of Mastership");}

            // Join the selected texts with a line break
            String textToShare = textsToShare.join('\n\n');

            // Share the text to other apps using the share system intent
            try {
              Share.share(textToShare);
              print("Done......");
            } catch (e) {
              // Handle any errors that occur while sharing
              print('Error sharing: $e');
            }
          },
        ),
      ],
    );
  }
}
