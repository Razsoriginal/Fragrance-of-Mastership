import 'package:flutter/foundation.dart';

import '../../../../../models/appdata/traditions/note_model.dart';
import '../note_service.dart';

class NoteProvider extends ChangeNotifier {
  late NoteService _noteService = NoteService();

  NoteProvider() {
    _noteService = NoteService();
    _init();
  }

  Future<void> _init() async {
    await _noteService.init();
    notifyListeners();
  }

  Future<void> init() async {
    await _noteService.init();
  }

  Future<void> add(Note note) async {
    await _noteService.add(note);
    notifyListeners();
  }

  Future<void> update(Note note) async {
    await _noteService.update(note);
    notifyListeners();
  }

  Future<void> delete(int id) async {
    await _noteService.delete(id);
    notifyListeners();
  }

  Note? get(int id) {
    return _noteService.get(id);
  }

  List<Note> getAll() {
    return _noteService.getAll();
  }
}
