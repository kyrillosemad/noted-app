// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view%20model/bloc/notes_bloc/notes_bloc.dart';
import 'package:todo/view/shared_widgets/top_title.dart';
import 'package:todo/view/view_modules/notes/widgets/addnotes_button.dart';
import 'package:todo/view/view_modules/notes/widgets/note_container.dart';

class NotesLoadedSTate extends StatelessWidget {
  final state;
  const NotesLoadedSTate({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: state.notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NoteItem(
                        note: state.notes[index],
                        onDelete: () {
                          NotesBloc().add(DeleteNotes(
                              state.notes[index].noteId.toString()));
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10.sp,
                  right: 10.sp,
                  child: const AddNoteButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
