import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/view/constants/urls.dart';

// ignore: non_constant_identifier_names
Future<List<TodoModel>> read_todo_fun() async {
  var res = await http.post(Uri.parse(read_todo_url),
      body: {"owner_id": id!.getString("userid")});
  if (res.statusCode == 200) {
    List<dynamic> res2 = await jsonDecode(res.body)['data'];
    List<TodoModel> todo =
        res2.map((json) => TodoModel.fromJson(json)).toList();

    return todo;
  } else {
    throw Exception("failed to load todo");
  }
}
