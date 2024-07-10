import 'package:todo/data/services/notes/delete_notes_fun.dart';
import 'package:todo/data/services/notes/insert_notes_fun.dart';
import 'package:todo/data/services/notes/read_notes_fun.dart';
import 'package:todo/data/services/notes/update_notes_fun.dart';

class NotesRepo {
  insertNote(title, body, ownerId) {
    return insert_notes_fun(title, body, ownerId);
  }

  deleteNote(noteId) {
    return delete_notes_fun(noteId);
  }

  updateNote(title, body, noteId) {
    return update_notes_fun(title, body, noteId);
  }

  readNotes() {
    return read_notes_fun();
  }

  insertLink(title, body, ownerId, link) {}
}
