part of 'notes_bloc.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<NoteModel> notes;
  NotesLoaded(this.notes);
}

class NotesError extends NotesState {
  final String msg;
  NotesError(this.msg);
}
