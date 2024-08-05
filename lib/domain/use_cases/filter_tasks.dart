import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/domain/repositories/task_repository.dart';

class FilterTasks {
  FilterTasks(this.repository);

  final TaskRepository repository;

  Future<List<Task>> call(bool isCompleted) async {
    return await repository.filterTasks(isCompleted);
  }
}
