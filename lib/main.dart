import 'package:flutter/material.dart';
import 'package:todo/app/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var curInd = 0;
SharedPreferences? id;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  id = await SharedPreferences.getInstance();
  return runApp(const TODO());
}
