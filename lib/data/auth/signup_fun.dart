import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/presentation/constants/urls.dart';
import 'package:todo/presentation/screens/login.dart';

// ignore: non_constant_identifier_names
signup_fun(username, email, password) async {
  var res = await http.post(Uri.parse(signup_url), body: {
    "username": username,
    "email": email,
    "password": password,
  });
  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done",
        "You have successfully created an account , Please log in to access your account ",
        backgroundColor: Colors.blue.withOpacity(0.5));
  } else {
    Get.defaultDialog(
        title: "failed",
        content: const Text("email or password isn't correct"));
  }
  Get.offAll(const LOGIN());
}
