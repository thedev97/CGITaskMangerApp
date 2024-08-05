import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cgi_task_v1/data/repositories/task_repository_impl.dart';
import 'package:cgi_task_v1/domain/use_cases/add_task.dart';
import 'package:cgi_task_v1/domain/use_cases/delete_task.dart';
import 'package:cgi_task_v1/domain/use_cases/filter_tasks.dart';
import 'package:cgi_task_v1/domain/use_cases/get_tasks.dart';
import 'package:cgi_task_v1/domain/use_cases/mark_task_complete.dart';
import 'package:cgi_task_v1/presentation/blocs/task_bloc.dart';
import 'package:cgi_task_v1/routes/app_route.dart';
import 'package:nested/nested.dart';

void main() {
  final TaskRepositoryImpl taskRepository = TaskRepositoryImpl();

  runApp(CGITaskApp(taskRepository: taskRepository));
}

class CGITaskApp extends StatelessWidget {
  const CGITaskApp({super.key, required this.taskRepository});

  final TaskRepositoryImpl taskRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<TaskBloc>(
          create: (BuildContext context) => TaskBloc(
            addTask: AddTask(taskRepository),
            deleteTask: DeleteTask(taskRepository),
            getTasks: GetTasks(taskRepository),
            markTaskComplete: MarkTaskComplete(taskRepository),
            filterTasks: FilterTasks(taskRepository),
          )..add(LoadTasks()),
        ),
      ],
      child: MaterialApp.router(
        title: 'CGI TaskManager App'.toUpperCase(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}
