part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadTasks extends TaskEvent {}

class AddNewTask extends TaskEvent {
  const AddNewTask(this.task);

  final Task task;

  @override
  List<Object> get props => <Object>[task];
}

class DeleteExistingTask extends TaskEvent {
  const DeleteExistingTask(this.id);

  final String id;

  @override
  List<Object> get props => <Object>[id];
}

class CompleteTask extends TaskEvent {
  const CompleteTask(this.id);

  final String id;

  @override
  List<Object> get props => <Object>[id];
}

class FilterTaskByStatus extends TaskEvent {
  const FilterTaskByStatus(this.isCompleted);

  final bool isCompleted;

  @override
  List<Object> get props => <Object>[isCompleted];
}
