import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/view/constants/urls.dart';
import 'package:todo/view/view_modules/home_page.dart';

// ignore: non_constant_identifier_names
delete_links_fun(linkId) async {
  var res = await http.post(Uri.parse(delete_links_url), body: {
    "link_id": linkId.toString(),
  });
  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "deleted successfully");
    curInd = 1;
    Get.offAll(const HomePage());
  } else {
    Get.snackbar("failed", "try again ");
  }
}
