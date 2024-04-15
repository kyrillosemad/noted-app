import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/presentation/constants/urls.dart';
import 'package:todo/presentation/screens/home_page.dart';

// ignore: non_constant_identifier_names
login_fun(email, password) async {
  var res = await http.post(Uri.parse(login_url), body: {
    "email": email,
    "password": password,
  });
  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "You have successfully logged in",
        backgroundColor: Colors.blue.withOpacity(0.5));
    id!.setString("userid", res2['data'][0]['id'].toString());
    id!.setString("username", res2['data'][0]['username'].toString());
    curInd = 0;
    // ignore: avoid_print
    Get.offAll(const HomePage());
  } else {
    Get.defaultDialog(
        title: "failed",
        content: const Text("email or password isn't correct"));
  }
}
