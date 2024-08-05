import 'package:cgi_task_v1/domain/entities/task.dart';
import 'package:cgi_task_v1/domain/use_cases/add_task.dart';
import 'package:cgi_task_v1/domain/use_cases/delete_task.dart';
import 'package:cgi_task_v1/domain/use_cases/filter_tasks.dart';
import 'package:cgi_task_v1/domain/use_cases/get_tasks.dart';
import 'package:cgi_task_v1/domain/use_cases/mark_task_complete.dart';
import 'package:cgi_task_v1/presentation/blocs/task_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'task_bloc_test.mocks.dart';

@GenerateMocks(
    <Type>[AddTask, DeleteTask, GetTasks, MarkTaskComplete, FilterTasks])
void main() {
  late TaskBloc taskBloc;
  late MockAddTask mockAddTask;
  late MockDeleteTask mockDeleteTask;
  late MockGetTasks mockGetTasks;
  late MockMarkTaskComplete mockMarkTaskComplete;
  late MockFilterTasks mockFilterTasks;

  setUp(() {
    mockAddTask = MockAddTask();
    mockDeleteTask = MockDeleteTask();
    mockGetTasks = MockGetTasks();
    mockMarkTaskComplete = MockMarkTaskComplete();
    mockFilterTasks = MockFilterTasks();

    taskBloc = TaskBloc(
      addTask: mockAddTask,
      deleteTask: mockDeleteTask,
      getTasks: mockGetTasks,
      markTaskComplete: mockMarkTaskComplete,
      filterTasks: mockFilterTasks,
    );
  });

  tearDown(() {
    taskBloc.close();
  });

  blocTest<TaskBloc, TaskState>(
    'emits [TaskLoading, TaskLoaded] when LoadTasks is added',
    build: () {
      when(mockGetTasks.call()).thenAnswer((_) async => <Task>[
            Task(
                id: '1',
                title: 'Test Task',
                description: 'Test Description',
                isCompleted: false)
          ]);
      return taskBloc;
    },
    act: (TaskBloc bloc) => bloc.add(LoadTasks()),
    expect: () => <TaskState>[
      TaskLoading(),
      TaskLoaded(<Task>[
        Task(
            id: '1',
            title: 'Test Task',
            description: 'Test Description',
            isCompleted: false)
      ])
    ],
  );

  blocTest<TaskBloc, TaskState>(
    'emits [TaskError] when LoadTasks fails',
    build: () {
      when(mockGetTasks.call()).thenThrow(Exception('Failed to load tasks'));
      return taskBloc;
    },
    act: (TaskBloc bloc) => bloc.add(LoadTasks()),
    expect: () =>
        <TaskState>[TaskLoading(), const TaskError('Failed to load tasks')],
  );

  blocTest<TaskBloc, TaskState>(
    'emits [TaskLoading, TaskLoaded] when AddNewTask is added',
    build: () {
      when(mockGetTasks.call()).thenAnswer((_) async => <Task>[
            Task(
                id: '1',
                title: 'Test Task',
                description: 'Test Description',
                isCompleted: false)
          ]);
      return taskBloc;
    },
    act: (TaskBloc bloc) {
      bloc.add(AddNewTask(Task(
          id: '1',
          title: 'Test Task',
          description: 'Test Description',
          isCompleted: false)));
      bloc.add(LoadTasks());
    },
    expect: () => <TaskState>[
      TaskLoading(),
      TaskLoaded(<Task>[
        Task(
            id: '1',
            title: 'Test Task',
            description: 'Test Description',
            isCompleted: false)
      ])
    ],
  );
}
