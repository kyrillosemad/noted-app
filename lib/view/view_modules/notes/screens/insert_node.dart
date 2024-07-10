import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/main.dart';
import 'package:todo/view%20model/bloc/notes_bloc/notes_bloc.dart';
import 'package:todo/view/shared_widgets/appbar.dart';

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
      ////////////////////////////////appBar//////////////////////////
      appBar: TopAppBar(
          name: "New Note",
          changed: changed,
          onSave: () {
            if (changed == true && form.currentState!.validate()) {
              NotesBloc().add(InsertNotes(
                  title_con.text.toString(),
                  body_con.text.toString(),
                  id!.getString("userid").toString()));
            } else {}
          }),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              ////////////////////////////////Title//////////////////////////
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
              ////////////////////////////////Body//////////////////////////
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
