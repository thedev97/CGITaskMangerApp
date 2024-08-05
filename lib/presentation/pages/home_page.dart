import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cgi_task_v1/routes/app_routes_const.dart';
import 'package:cgi_task_v1/shared/widgets/button/ct_icon_button.dart';
import 'package:cgi_task_v1/presentation/widgets/task_filter.dart';
import 'package:cgi_task_v1/presentation/widgets/task_list.dart';
import 'package:cgi_task_v1/shared/widgets/app_bar/app_bar_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context,
            addTask: CGITaskIconButton(
              height: 30,
              width: 30,
              onTap: () =>
                  context.push('${AppRoutes.home}/${AppRoutes.addTask}'),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
        body: const Column(
          children: <Widget>[
            SizedBox(height: 8),
            TaskFilter(),
            Expanded(child: TaskList()),
          ],
        ),
      ),
    );
  }
}
