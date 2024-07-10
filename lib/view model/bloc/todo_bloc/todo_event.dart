part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodo extends TodoEvent {}

class InsertTodo extends TodoEvent {
  final String title;
  final String body;
  final String ownerId;
  final String endtime;

  InsertTodo(this.title, this.body, this.ownerId, this.endtime);
}

class DeleteTodo extends TodoEvent {
  final String todoId;
  DeleteTodo(this.todoId);
}

class UpdateTodo extends TodoEvent {
  final String title;
  final String body;
  final String ownerId;
  final String endtime;
  UpdateTodo(this.title, this.body, this.ownerId, this.endtime);
}
