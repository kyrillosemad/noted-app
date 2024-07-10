import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';
import 'package:todo/models/notes_model.dart';
import 'package:todo/view/constants/urls.dart';

// ignore: non_constant_identifier_names
Future<List<NoteModel>> read_notes_fun() async {
  var res = await http.post(Uri.parse(read_notes_url),
      body: {"owner_id": id!.getString("userid")});
  if (res.statusCode == 200) {
    List<dynamic> res2 = await jsonDecode(res.body)['data'];
    List<NoteModel> notes =
        res2.map((json) => NoteModel.fromJson(json)).toList();
    return notes;
  } else {
    throw Exception("failed to load notes");
  }
}
