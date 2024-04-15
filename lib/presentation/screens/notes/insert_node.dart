import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/notes/insert_notes_fun.dart';
import 'package:todo/main.dart';

class InsertNote extends StatefulWidget {
  const InsertNote({super.key});

  @override
  State<InsertNote> createState() => _InsertNoteState();
}

class _InsertNoteState extends State<InsertNote> {
  GlobalKey<FormState> form = GlobalKey();
  // ignore: non_constant_identifier_names
  TextEditingController title_con = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController body_con = TextEditingController();
  bool changed = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 57, 88),
        actions: [
          InkWell(
            onTap: () {
              if (changed == true && form.currentState!.validate()) {
                insert_notes_fun(
                    title_con.text, body_con.text, id!.getString("userid"));
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
            TyperAnimatedText("New note",
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
                    maxLines: 20,
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY()
            ],
          ),
        ),
      ),
    );
  }
}
