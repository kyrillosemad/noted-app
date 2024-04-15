import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/todo/insert_todo_fun.dart';
import 'package:todo/main.dart';

class InsertTodo extends StatefulWidget {
  const InsertTodo({super.key});

  @override
  State<InsertTodo> createState() => _InsertTodoState();
}

class _InsertTodoState extends State<InsertTodo> {
  GlobalKey<FormState> form = GlobalKey();
  // ignore: non_constant_identifier_names
  TextEditingController title_con = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController body_con = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController endtime_con = TextEditingController();
  bool changed = false;
  late String finalendtime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 57, 88),
        actions: [
          InkWell(
            onTap: () {
              if (changed == true && form.currentState!.validate()) {
                insert_todo_fun(title_con.text, body_con.text,
                    id!.getString("userid"), endtime_con.text);
              } else {}
            },
            child: Container(
              margin: EdgeInsets.all(10.sp),
              width: 18.w,
              height: 5.h,
              decoration: BoxDecoration(
                  color: changed
                      ? const Color.fromRGBO(1, 203, 145, 1)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: const Center(
                child: Text("Save"),
              ),
            ),
          )
        ],
        title: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText("New Task",
                speed: const Duration(milliseconds: 150))
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length > 20) {
                        return "must be less than 20";
                      } else {
                        return null;
                      }
                    },
                    controller: title_con,
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
                height: 2.h,
              ),
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    
                    controller: body_con,
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
                          controller: endtime_con,
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
                        onPressed: () async {
                          final DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(200),
                            lastDate: DateTime(2500),
                          );

                          // ignore: use_build_context_synchronously
                          final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialEntryMode: TimePickerEntryMode.dial,
                            initialTime: const TimeOfDay(hour: 0, minute: 0),
                          );

                          setState(() {
                            finalendtime =
                                "${date!.year}-${date.month}-${date.day}  ${time!.hour}:${time.minute}";
                            endtime_con.text = finalendtime;
                            changed = true;
                          });
                        },
                        icon: Icon(
                          Icons.date_range,
                          size: 25.sp,
                          color: const Color.fromARGB(255, 0, 57, 88),
                        ),
                      )
                    ],
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY(),
            ],
          ),
        ),
      ),
    );
  }
}
