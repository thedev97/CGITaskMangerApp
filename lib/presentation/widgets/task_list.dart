import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cgi_task_v1/presentation/blocs/task_bloc.dart';
import 'package:cgi_task_v1/presentation/widgets/task_item.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (BuildContext context, TaskState state) {
        if (state is TaskLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
            strokeAlign: 1,
          ));
        } else if (state is TaskLoaded) {
          if (state.tasks.isEmpty) {
            return Center(
              child: Text('No tasks'.toUpperCase(), style: CGITaskFonts.errorFonts),
            );
          }
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskItem(task: state.tasks[index]);
            },
          );
        } else if (state is TaskError) {
          return Center(child: Text(state.message));
        }
        return Center(
          child: Text('No tasks'.toUpperCase(), style: CGITaskFonts.errorFonts),
        );
      },
    );
  }
}
