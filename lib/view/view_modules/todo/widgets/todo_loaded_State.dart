// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view/shared_widgets/top_title.dart';
import 'package:todo/view/view_modules/todo/screens/todo_details.dart';
import 'package:todo/view/view_modules/todo/widgets/todo_Container.dart';
import 'package:todo/view/view_modules/todo/screens/insert_todo.dart'
    as insert_page;

class TodoLoadedState extends StatelessWidget {
  final state;
  const TodoLoadedState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(children: [
          const TopTitle(),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: EdgeInsets.all(7.sp),
                width: 100.w,
                height: 83.h,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: state.Todo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(const TodoDetails(), arguments: {
                          "title": state.Todo[index].title,
                          "body": state.Todo[index].body,
                          "todo_id": state.Todo[index].todoId,
                          "endtime": state.Todo[index].endtime,
                        });
                      },
                      child: TodoItem(todo: state.Todo[index]),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(1, 203, 145, 1),
                    radius: 22.sp,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 15.sp,
                        color: const Color.fromARGB(255, 0, 57, 88),
                      ),
                      onPressed: () {
                        Get.to(const insert_page.InsertTodo());
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
