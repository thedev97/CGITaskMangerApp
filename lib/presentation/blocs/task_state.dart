part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => <Object>[];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  const TaskLoaded(this.tasks);

  final List<Task> tasks;

  @override
  List<Object> get props => <Object>[tasks];
}

class TaskError extends TaskState {
  const TaskError(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
