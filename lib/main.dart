import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/view/view_modules/home_page.dart';
import 'package:todo/view/view_modules/introduction.dart';

SharedPreferences? id;
var curInd = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  id = await SharedPreferences.getInstance();
  runApp(const TODO());
}

class TODO extends StatelessWidget {
  const TODO({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        String? userId = id?.getString("userid");
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: userId == null ? const Introduction() : const HomePage(),
        );
      },
    );
  }
}
