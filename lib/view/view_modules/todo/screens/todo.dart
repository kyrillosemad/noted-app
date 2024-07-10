import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/view%20model/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo/view/view_modules/todo/widgets/todo_loaded_State.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final todoBloc = TodoBloc();

  @override
  void initState() {
    super.initState();
    todoBloc.add(LoadTodo());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: todoBloc,
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoLoaded) {
          return TodoLoadedState(state: state);
        } else if (state is TodoError) {
          return Center(child: Text(state.msg));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  @override
  void dispose() {
    todoBloc.close();
    super.dispose();
  }
}
