import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/domain/repositories/task_repository.dart';

class AddTask {
  AddTask(this.repository);

  final TaskRepository repository;

  Future<void> call(Task task) async {
    await repository.addTask(task);
  }
}
