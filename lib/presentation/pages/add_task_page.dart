import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/presentation/blocs/task_bloc.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';
import 'package:cgi_task_v1/shared/widgets/app_bar/app_bar_builder.dart';
import 'package:cgi_task_v1/shared/widgets/button/ct_elevated_button.dart';
import 'package:cgi_task_v1/shared/widgets/common.dart';
import 'package:cgi_task_v1/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildLeadingAppBar(title: 'Add Task'.toUpperCase()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CGITextField(
              controller: _titleController,
              hintText: 'Enter Task'.toUpperCase(),
            ),
            const SizedBox(height: 12),
            CGITextField(
              controller: _descriptionController,
              hintText: 'Enter Description'.toUpperCase(),
            ),
            const SizedBox(height: 20),
            CGITaskElevatedButton(
                text: 'Add Task'.toUpperCase(),
                buttonTextStyle: CGITaskFonts.buttonRegularFonts15,
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () => _addTask(context)),
          ],
        ),
      ),
    );
  }

  void _addTask(BuildContext context) {
    final String title = _titleController.text;
    final String description = _descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      showSnackBar(context, 'Please fill in both fields.'.toUpperCase());
      return;
    }

    final Task task = Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      isCompleted: false,
    );
    context.read<TaskBloc>().add(AddNewTask(task));
    Navigator.pop(context);
  }
}
