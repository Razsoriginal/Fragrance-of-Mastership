import '../../../../models/appdata/traditions/note_model.dart';
import '../../hive_service_base.dart';

class NoteService extends HiveServiceBase<Note> {
  Future<void> init() async {
    await initBox('notes');
  }

  Future<void> add(Note note) async {
    await box.put(note.id, note);
  }

  Future<void> update(Note note) async {
    await box.put(note.id, note);
  }

  Future<void> delete(int id) async {
    await box.delete(id);
  }

  Note? get(int id) {
    return box.get(id);
  }

  List<Note> getAll() {
    return box.values.toList();
  }
}
