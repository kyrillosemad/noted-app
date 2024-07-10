import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/view%20model/bloc/notes_bloc/notes_bloc.dart';
import 'package:todo/view/view_modules/notes/widgets/notes_loaded_state.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final notesBloc = NotesBloc();

  @override
  void initState() {
    super.initState();
    notesBloc.add(LoadNotes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      bloc: notesBloc,
      builder: (context, state) {
        if (state is NotesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotesLoaded) {
          return NotesLoadedSTate(state: state);
        } else if (state is NotesError) {
          return Center(child: Text(state.msg));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  @override
  void dispose() {
    notesBloc.close();
    super.dispose();
  }
}
