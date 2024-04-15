import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/presentation/constants/urls.dart';
import 'package:todo/presentation/screens/home_page.dart';

// ignore: non_constant_identifier_names
insert_notes_fun(title, body, ownerId) async {
  var res = await http.post(Uri.parse(insert_notes_url), body: {
    "title": title,
    "body": body,
    "owner_id": ownerId,
  });
  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "inserted successfully");
    curInd = 0;
    Get.offAll(const HomePage());
  } else {
    Get.snackbar("failed", "try again ");
  }
}
