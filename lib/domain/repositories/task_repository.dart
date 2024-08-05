import 'package:cgi_task_v1/domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> deleteTask(String id);
  Future<void> markTaskComplete(String id);
  Future<List<Task>> getTasks();
  Future<List<Task>> filterTasks(bool isCompleted);
}
