import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/traditions/notes/provider/notes_provider.dart';
import '../../../../models/appdata/traditions/note_model.dart';

class Body extends StatefulWidget {
  final int index;

  const Body({Key? key, required this.index}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchNote();
  }

  void _fetchNote() async {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    final note = noteProvider.get(widget.index);
    if (note != null) {
      _noteController.text = note.content;
    }
  }

  void _saveNote() {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    final note = Note(id: widget.index, content: _noteController.text);
    if (_noteController.text.isNotEmpty) {
      noteProvider.update(note).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Note saved successfully!')),
        );
        Navigator.of(context).pop();
      });
    }
  }

  void _deleteNote() {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    noteProvider.delete(widget.index).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note deleted successfully!')),
      );
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Edit your notes here."),
          Expanded(
            child: TextFormField(
              controller: _noteController,
              maxLines: null, // Allows multiline input
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _saveNote,
                icon: const Icon(Icons.save),
                label: const Text("Save"),
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _deleteNote,
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
