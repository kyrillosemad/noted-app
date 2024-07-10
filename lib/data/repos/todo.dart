import 'package:todo/data/services/todo/delete_todo_fun.dart';
import 'package:todo/data/services/todo/insert_todo_fun.dart';
import 'package:todo/data/services/todo/read_todo_fun.dart';
import 'package:todo/data/services/todo/update_todo_fun.dart';

class TodoRepo {
  insertTodo(title, body, ownerId, endtime) {
    return insert_todo_fun(title, body, ownerId, endtime);
  }

  deleteTodo(todoId) {
    return delete_todo_fun(todoId);
  }

  updateTodo(title, body, todoId, endtime) {
    return update_todo_fun(title, body, todoId, endtime);
  }

  readTodo() {
    return read_todo_fun();
  }
}
