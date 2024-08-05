import 'package:cgi_task_v1/domain/repositories/task_repository.dart';

class DeleteTask {
  DeleteTask(this.repository);

  final TaskRepository repository;

  Future<void> call(String id) async {
    await repository.deleteTask(id);
  }
}
