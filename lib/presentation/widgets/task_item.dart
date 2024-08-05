import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/presentation/blocs/task_bloc.dart';
import 'package:cgi_task_v1/shared/utils/styles/font_styles.dart';
import 'package:cgi_task_v1/shared/widgets/button/ct_icon_button.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: task.isCompleted
              ? Colors.green.shade400
              : Colors.orangeAccent.shade400,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.2),
                      child: Text(
                        task.isCompleted ? 'COMPLETED' : 'PENDING',
                        style: CGITaskFonts.semiBoldFonts35,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                task.title.toUpperCase(),
                style: CGITaskFonts.semiBoldFonts16,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                task.description.toUpperCase(),
                style: CGITaskFonts.regularFonts12,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!task.isCompleted)
                    CGITaskIconButton(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        task.isCompleted
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: task.isCompleted ? Colors.green : Colors.white,
                        size: 25,
                      ),
                      onTap: () =>
                          context.read<TaskBloc>().add(CompleteTask(task.id)),
                    ),
                  CGITaskIconButton(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 25,
                    ),
                    onTap: () => context
                        .read<TaskBloc>()
                        .add(DeleteExistingTask(task.id)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
