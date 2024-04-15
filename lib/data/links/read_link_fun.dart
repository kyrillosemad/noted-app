import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/presentation/constants/urls.dart';

// ignore: non_constant_identifier_names
read_links_fun() async {
  var res = await http.post(Uri.parse(read_links_url),
      body: {"owner_id": id!.getString("userid")});
  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
  
    return res2['data'];
  } else {
  }
}
