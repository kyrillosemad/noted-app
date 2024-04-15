import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/presentation/constants/urls.dart';
import 'package:todo/presentation/screens/home_page.dart';

// ignore: non_constant_identifier_names
update_todo_fun(title, body, todoId, endtime) async {
  var res = await http.post(Uri.parse(update_todo_url), body: {
    "title": title,
    "body": body,
    "todo_id": todoId.toString(),
    "endtime": endtime,
  });
  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "updated successfully");
    curInd = 2;
    Get.offAll(const HomePage());
  } else {
    Get.snackbar("failed", "try again ");
  }
}
