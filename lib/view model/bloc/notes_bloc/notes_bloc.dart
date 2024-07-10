import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/repos/Notes.dart';
import 'package:todo/models/notes_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesInitial()) {
    on<LoadNotes>(onLoadNotes);
    on<InsertNotes>(onInsertNotes);
    on<DeleteNotes>(onDeleteNotes);
    on<UpdateNotes>(onUpdateNotes);
  }

  FutureOr<void> onLoadNotes(LoadNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      // ignore: non_constant_identifier_names
      List<NoteModel> Notes = await NotesRepo().readNotes();
      emit(NotesLoaded(Notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  FutureOr<void> onInsertNotes(

      InsertNotes event,
      Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      await NotesRepo().insertNote(event.title, event.body, event.ownerId);
      List<NoteModel> notes = NotesRepo().readNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  FutureOr<void> onDeleteNotes(
      DeleteNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      await NotesRepo().deleteNote(event.noteId);
      List<NoteModel> notes = await NotesRepo().readNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  FutureOr<void> onUpdateNotes(
      UpdateNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      await NotesRepo().updateNote(event.title, event.body, event.noteId);
      List<NoteModel> notes = NotesRepo().readNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
