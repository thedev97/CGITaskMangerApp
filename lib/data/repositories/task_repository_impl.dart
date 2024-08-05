import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<Task> _tasks = <Task>[];

  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((Task task) => task.id == id);
  }

  @override
  Future<void> markTaskComplete(String id) async {
    final int taskIndex = _tasks.indexWhere((Task task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(
        id: _tasks[taskIndex].id,
        title: _tasks[taskIndex].title,
        description: _tasks[taskIndex].description,
        isCompleted: true,
      );
    }
  }

  @override
  Future<List<Task>> getTasks() async {
    return _tasks;
  }

  @override
  Future<List<Task>> filterTasks(bool isCompleted) async {
    return _tasks
        .where((Task task) => task.isCompleted == isCompleted)
        .toList();
  }
}
