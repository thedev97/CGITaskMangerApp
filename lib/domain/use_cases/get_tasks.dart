import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/domain/repositories/task_repository.dart';

class GetTasks {
  GetTasks(this.repository);

  final TaskRepository repository;

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
