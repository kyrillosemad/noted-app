// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/repos/Todo.dart';
import 'package:todo/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodo>(onLoadTodo);
    on<InsertTodo>(onInsertTodo);
    on<DeleteTodo>(onDeleteTodo);
    on<UpdateTodo>(onUpdateTodo);
  }

  FutureOr<void> onLoadTodo(LoadTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      List<TodoModel> Todo = await TodoRepo().readTodo();
      emit(TodoLoaded(Todo));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

Future<void> onInsertTodo(InsertTodo event, Emitter<TodoState> emit) async {
  emit(TodoLoading());
  try {
    await TodoRepo().insertTodo(event.title, event.body, event.ownerId, event.endtime);
    List<TodoModel> todoList = await TodoRepo().readTodo();
    emit(TodoLoaded(todoList));
  } catch (e) {
    emit(TodoError(e.toString()));
  }
}

  FutureOr<void> onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await TodoRepo().deleteTodo(event.todoId);
      List<TodoModel> Todo = await TodoRepo().readTodo();
      emit(TodoLoaded(Todo));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  FutureOr<void> onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await TodoRepo()
          .updateTodo(event.title, event.body, event.ownerId, event.endtime);
      List<TodoModel> Todo = TodoRepo().readTodo();
      emit(TodoLoaded(Todo));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
