// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view%20model/bloc/todo_bloc/todo_bloc.dart';

class TodoItem extends StatelessWidget {
  final todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.sp),
      padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 57, 88),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              todo.title.toString(),
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              todo.body.toString(),
              maxLines: 6,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: 100.w,
            child: Center(
              child: Text(
                todo.endtime.toString(),
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color.fromRGBO(1, 203, 145, 1),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "delete!",
                  content: const Text("are you sure to delete this task"),
                  confirmTextColor: Colors.white,
                  onCancel: () {},
                  onConfirm: () {
                    TodoBloc().add(DeleteTodo(todo.todoId.toString()));
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
    ).animate().fade(delay: 200.ms, duration: 200.ms);
  }
}
