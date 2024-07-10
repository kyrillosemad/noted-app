// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view/view_modules/notes/screens/note_datails.dart';

class NoteItem extends StatelessWidget {
  final note;
  final Function onDelete;

  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const NoteDetails(), arguments: {
          "title": note.title,
          "body": note.body,
          "note_id": note.noteId,
        });
      },
      child: Container(
        margin: EdgeInsets.all(3.sp),
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 57, 88),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title.toString(),
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              note.body.toString(),
              maxLines: 7,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Delete!",
                    content: const Text("Are you sure to delete this note?"),
                    confirmTextColor: Colors.white,
                    onCancel: () {},
                    onConfirm: () {
                      onDelete();
                    },
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 33.sp,
                ),
              ),
            ),
          ],
        ),
      ).animate().fade(delay: 200.ms, duration: 200.ms),
    );
  }
}
