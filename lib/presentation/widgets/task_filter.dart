import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cgi_task_v1/presentation/blocs/task_bloc.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';
import 'package:cgi_task_v1/shared/widgets/button/ct_segmented_button.dart';

class TaskFilter extends StatelessWidget {
  const TaskFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CGITaskSegmentedButton(
          text: 'All'.toUpperCase(),
          buttonTextStyle: CGITaskFonts.buttonRegularFonts12,
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () => context.read<TaskBloc>().add(LoadTasks()),
        ),
        CGITaskSegmentedButton(
          text: 'Pending'.toUpperCase(),
          buttonTextStyle: CGITaskFonts.buttonRegularFonts12,
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () =>
              context.read<TaskBloc>().add(const FilterTaskByStatus(false)),
        ),
        CGITaskSegmentedButton(
          text: 'Completed'.toUpperCase(),
          buttonTextStyle: CGITaskFonts.buttonRegularFonts12,
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () =>
              context.read<TaskBloc>().add(const FilterTaskByStatus(true)),
        ),
      ],
    );
  }
}
