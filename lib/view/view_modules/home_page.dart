import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/main.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:todo/view/view_modules/auth/screens/login.dart';
import 'package:todo/view/view_modules/links/screens/links.dart';
import 'package:todo/view/view_modules/notes/screens/notes.dart';
import 'package:todo/view/view_modules/todo/screens/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> body = [
    const Notes(),
    const Links(),
    const Todo(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 8.h,
        index: curInd,
        items: [
          CurvedNavigationBarItem(
              child: Icon(
                Icons.notes,
                size: 15.sp,
              ),
              label: 'Notes',
              labelStyle: TextStyle(fontSize: 10.sp)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.link,
                size: 15.sp,
              ),
              label: 'Links',
              labelStyle: TextStyle(fontSize: 10.sp)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.timelapse,
                size: 15.sp,
              ),
              label: 'Tasks ',
              labelStyle: TextStyle(fontSize: 10.sp)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.logout,
                size: 12.sp,
              ),
              label: 'logout',
              labelStyle: TextStyle(fontSize: 10.sp)),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 0, 54, 84),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            if (index == 3) {
              Get.defaultDialog(
                title: "logout!",
                content: const Text("are you sure to logout"),
                confirmTextColor: Colors.white,
                onCancel: () {},
                onConfirm: () {
                  id!.clear();
                  Get.offAll(const Login());
                },
              );
            } else {
              curInd = index;
            }
          });
        },
        letIndexChange: (index) => true,
      ),
      body: body[curInd],
    );
  }
}
