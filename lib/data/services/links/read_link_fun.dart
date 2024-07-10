import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';

import 'package:todo/models/links_model.dart';
import 'package:todo/view/constants/urls.dart';

// ignore: non_constant_identifier_names
Future<List<LinkModel>> read_links_fun() async {
  final res = await http.post(Uri.parse(read_links_url),
      body: {"owner_id": id!.getString("userid")});

  if (res.statusCode == 200) {
    List<dynamic> res2 = await jsonDecode(res.body)['data'];
    List<LinkModel> links =
        res2.map((json) => LinkModel.fromJson(json)).toList();
    return links;
  } else {
    throw Exception("Failed to load links. Status code: ${res.statusCode}");
  }
}
