import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view/view_modules/notes/screens/insert_node.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: const Color.fromRGBO(1, 203, 145, 1),
        radius: 22.sp,
        child: Center(
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: 15.sp,
              color: const Color.fromARGB(255, 0, 57, 88),
            ),
            onPressed: () {
              Get.to(const InsertNote());
            },
          ),
        ),
      ),
    );
  }
}
