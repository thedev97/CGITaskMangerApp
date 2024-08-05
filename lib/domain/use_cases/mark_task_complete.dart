import 'package:cgi_task_v1/domain/repositories/task_repository.dart';

class MarkTaskComplete {
  MarkTaskComplete(this.repository);

  final TaskRepository repository;

  Future<void> call(String id) async {
    await repository.markTaskComplete(id);
  }
}
