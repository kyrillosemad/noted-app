part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class LoadNotes extends NotesEvent {}

class InsertNotes extends NotesEvent {
  final String title;
  final String body;
  final String ownerId;

  InsertNotes(this.title, this.body, this.ownerId);
}

class DeleteNotes extends NotesEvent {
  final String noteId;
  DeleteNotes(this.noteId);
}

class UpdateNotes extends NotesEvent {
  final String title;
  final String body;
  final String noteId;
  UpdateNotes(this.title, this.body, this.noteId);
}
