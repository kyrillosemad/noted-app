import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view%20model/bloc/notes_bloc/notes_bloc.dart';
import 'package:todo/view/shared_widgets/appbar.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({super.key});

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  var title = Get.arguments['title'];
  var body = Get.arguments['body'];
  var noteId = Get.arguments['note_id'];
  GlobalKey<FormState> form = GlobalKey();
  TextEditingController titleCon = TextEditingController();
  TextEditingController bodyCon = TextEditingController();
  bool changed = false;
  @override
  void initState() {
    super.initState();
    titleCon.text = title;
    bodyCon.text = body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////appBar//////////////////////////
      appBar: TopAppBar(
          name: "Note Details",
          changed: changed,
          onSave: () {
            if (changed == true && form.currentState!.validate()) {
              NotesBloc().add(UpdateNotes(titleCon.text.toString(),
                  bodyCon.text.toString(), noteId.toString()));
            } else {}
          }),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              ////////////////////////////////title//////////////////////////
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
                height: 2.h,
              ),
              ////////////////////////////////body//////////////////////////
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
                    maxLines: 20,
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY()
            ],
          ),
        ),
      ),
    );
  }
}
