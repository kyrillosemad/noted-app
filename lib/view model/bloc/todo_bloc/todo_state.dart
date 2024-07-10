part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  // ignore: non_constant_identifier_names
  final List<TodoModel> Todo;
  TodoLoaded(this.Todo);
}

class TodoError extends TodoState {
  final String msg;
  TodoError(this.msg);
}
