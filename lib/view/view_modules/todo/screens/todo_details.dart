// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view%20model/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo/view/shared_widgets/appbar.dart';

class TodoDetails extends StatefulWidget {
  const TodoDetails({super.key});

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  var title = Get.arguments['title'];
  var body = Get.arguments['body'];
  var todoId = Get.arguments['todo_id'];
  var endtime = Get.arguments['endtime'];
  GlobalKey<FormState> form = GlobalKey();

  TextEditingController titleCon = TextEditingController();
  TextEditingController bodyCon = TextEditingController();
  TextEditingController endtimeCon = TextEditingController();
  late String finalendtime;
  bool changed = false;
  @override
  void initState() {
    super.initState();

    titleCon.text = title;
    bodyCon.text = body;
    endtimeCon.text = endtime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////appBar//////////////////////////////////////
      appBar: TopAppBar(
          name: "Todo Details",
          changed: changed,
          onSave: () {
            if (changed == true && form.currentState!.validate()) {
              TodoBloc().add(UpdateTodo(
                  titleCon.text.toString(),
                  bodyCon.text.toString(),
                  todoId.toString(),
                  endtimeCon.text.toString()));
            } else {}
          }),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              ////////////////////////Title//////////////////////////////////////
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    controller: titleCon,
                    onChanged: (value) {
                      setState(() {
                        changed = true;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.title),
                      labelText: "title",
                    ),
                    style: TextStyle(fontSize: 15.sp),
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY(),
              SizedBox(
                height: 0.h,
              ),
              ////////////////////////Body//////////////////////////////////////
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    controller: bodyCon,
                    onChanged: (value) {
                      setState(() {
                        changed = true;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "body",
                    ),
                    style: TextStyle(fontSize: 15.sp),
                    maxLines: 15,
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY(),
              SizedBox(height: 2.h),
              ////////////////////////DAte//////////////////////////////////////
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: TextFormField(
                          readOnly: true,
                          controller: endtimeCon,
                          onChanged: (value) {
                            setState(() {
                              changed = true;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "endtime",
                          ),
                          style: TextStyle(fontSize: 13.sp),
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              changed = true;
                            });
                            setState(() async {
                              final DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(200),
                                  lastDate: DateTime(2500));
                              final TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialEntryMode: TimePickerEntryMode.dial,
                                initialTime:
                                    const TimeOfDay(hour: 0, minute: 0),
                              );
                              finalendtime =
                                  "${date!.year}-${date.month}-${date.day}  ${time!.hour}:${time.minute}";

                              endtimeCon.text = finalendtime;
                            });
                          },
                          icon: Icon(
                            Icons.date_range,
                            size: 25.sp,
                            color: const Color.fromARGB(255, 0, 57, 88),
                          ))
                    ],
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY(),
            ],
          ),
        ),
      ),
    );
  }
}
