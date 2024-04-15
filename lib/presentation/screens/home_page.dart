import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/main.dart';
import 'package:todo/presentation/screens/links/links.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:todo/presentation/screens/login.dart';
import 'package:todo/presentation/screens/notes/notes.dart';
import 'package:todo/presentation/screens/todo/todo.dart';


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
        index: curInd,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.notes),
            label: 'Notes',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.link),
            label: 'Links',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.timelapse),
            label: 'Tasks ',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.logout),
            label: 'logout',
          ),
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
                  Get.offAll(const LOGIN());
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
