import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/colors.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/screens/traditions/collections/save_hadith/add_collections.dart';
import 'package:fragrance_of_mastership/screens/traditions/hadith_page/components/bottomsheet_content.dart';
import 'package:fragrance_of_mastership/screens/traditions/notes/traditions_notes.dart';

class HadithOptions extends StatefulWidget {
  const HadithOptions({
    super.key,
    required this.references,
    required this.index,
  });

  final List<String> references;
  final int index;

  @override
  State<HadithOptions> createState() => _HadithOptionsState();
}

class _HadithOptionsState extends State<HadithOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildContainer(
          text: 'Notes',
          iconName: Icons.edit_note,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TraditionNote(index: widget.index))),
        ),
        buildContainer(
          text: 'Collections',
          iconName: Icons.collections_bookmark_outlined,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCollections(index: widget.index))),
        ),
        buildContainer(
            text: 'References',
            iconName: Icons.library_books_rounded,
            onPressed: () => _handleFABPressed()),
      ],
    );
  }

  GestureDetector buildContainer(
      {required String text,
      required IconData iconName,
      final Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black38)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconName,
                color: Colors.black38,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  void _saveNotes(context) {
    final notesController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: fPrimaryLightColor,
            title: const Text(" Notes"),
            content: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                hintText: 'Enter your notes here',
              ),
              onChanged: (value) {},
              controller: notesController,
            ),
            actions: [
              notesController.text.isEmpty
                  ? TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: fPrimaryColor),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    )
                  : TextButton(
                      onPressed: () {
                        notesController.text = "";
                      },
                      child: const Text(
                        "Clear",
                        style: TextStyle(color: fPrimaryColor),
                      )),
              TextButton(
                child: const Text(
                  'Save',
                  style: TextStyle(color: fPrimaryColor),
                ),
                onPressed: () {
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: Container(
            width: SizeConfig.screenWidth * 0.9,
            color: fPrimaryLightColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "References",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.references.join("\n\n")),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
