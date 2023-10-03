import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fragrance_of_mastership/controllers/services/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/notes/provider/notes_provider.dart';
import 'hadith_options.dart';

class HadithPageContent extends StatefulWidget {
  const HadithPageContent({
    Key? key,
    required this.arabic,
    required this.english,
    required this.notes,
    required this.references,
    required this.index,
  }) : super(key: key);

  final String arabic;
  final String english;
  final List<String> notes;
  final List<String> references;
  final int index;

  @override
  State<HadithPageContent> createState() => _HadithPageContentState();
}

class _HadithPageContentState extends State<HadithPageContent> {
  String personalNote = '';

  @override
  Widget build(BuildContext context) {
    return Consumer2<NoteProvider, SettingsProvider>(
      builder: (context, noteProvider, settingsProvider, child) {
        final note = noteProvider.get(widget.index);
        final settings = settingsProvider.settings;
        final arabicSize = settings?.arabicSize ?? 35;
        final engSize = settings?.translationSize ?? 20;
        if (note != null) {
          personalNote = note.content;
        }

        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8)),
                child: HadithOptions(
                  references: widget.references,
                  index: widget.index,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8)),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    widget.arabic,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'noorehuda',
                      fontSize: arabicSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Html(
                data: "<div>${widget.english}</div>",
                style: {
                  'div': Style(
                    fontSize: FontSize(engSize),
                  ),
                },
              ),
              const SizedBox(
                height: 25,
              ),
              if (widget.notes.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8)),
                  child: Text(
                    "Notes:",
                    style: TextStyle(
                        fontSize: engSize - 3, fontWeight: FontWeight.w600),
                  ),
                ),
                Html(
                  data: "<div>${widget.notes.join('\n')}</div>",
                  style: {
                    'div': Style(
                      padding: HtmlPaddings.zero,
                      fontSize: FontSize(engSize),
                    ),
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
              if (personalNote.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Notes:",
                        style: TextStyle(
                            fontSize: engSize - 3, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        personalNote,
                        style: TextStyle(
                            fontSize: engSize - 0.5), // -0.5 from actucal size
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
