import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/main.dart';
import 'package:todo/presentation/screens/home_page.dart';
import 'package:todo/presentation/screens/introduction.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    return Sizer(builder: (context, Orientation, DeviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: id!.getString("userid") == null ? const Introduction() : const HomePage(),
      );
    });
  }
}
