import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cgi_task_v1/domain/use_cases/add_task.dart';
import 'package:cgi_task_v1/domain/use_cases/delete_task.dart';
import 'package:cgi_task_v1/domain/use_cases/filter_tasks.dart';
import 'package:cgi_task_v1/domain/use_cases/get_tasks.dart';
import 'package:cgi_task_v1/domain/use_cases/mark_task_complete.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({
    required this.addTask,
    required this.deleteTask,
    required this.getTasks,
    required this.markTaskComplete,
    required this.filterTasks,
  }) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddNewTask>(_onAddNewTask);
    on<DeleteExistingTask>(_onDeleteExistingTask);
    on<CompleteTask>(_onCompleteTask);
    on<FilterTaskByStatus>(_onFilterTaskByStatus);
  }

  final AddTask addTask;
  final DeleteTask deleteTask;
  final GetTasks getTasks;
  final MarkTaskComplete markTaskComplete;
  final FilterTasks filterTasks;

  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final List<Task> tasks = await getTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(const TaskError('Failed to load tasks'));
    }
  }

  void _onAddNewTask(AddNewTask event, Emitter<TaskState> emit) async {
    if (state is TaskLoaded) {
      final List<Task> updatedTasks =
          List<Task>.from((state as TaskLoaded).tasks)..add(event.task);
      emit(TaskLoaded(updatedTasks));
      await addTask(event.task);
    }
  }

  void _onDeleteExistingTask(
      DeleteExistingTask event, Emitter<TaskState> emit) async {
    if (state is TaskLoaded) {
      final List<Task> updatedTasks = (state as TaskLoaded)
          .tasks
          .where((Task task) => task.id != event.id)
          .toList();
      emit(TaskLoaded(updatedTasks));
      await deleteTask(event.id);
    }
  }

  void _onCompleteTask(CompleteTask event, Emitter<TaskState> emit) async {
    if (state is TaskLoaded) {
      final List<Task> updatedTasks =
          (state as TaskLoaded).tasks.map((Task task) {
        return task.id == event.id ? task.copyWith(isCompleted: true) : task;
      }).toList();
      emit(TaskLoaded(updatedTasks));
      await markTaskComplete(event.id);
    }
  }

  void _onFilterTaskByStatus(
      FilterTaskByStatus event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final List<Task> tasks = await filterTasks(event.isCompleted);
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(const TaskError('Failed to filter tasks'));
    }
  }
}
