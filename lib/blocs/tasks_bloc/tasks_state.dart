part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskModel> allTasks;
  final List<TaskModel> removedTasks;
  const TasksState({
    this.allTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });
  @override
  List<Object?> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<TaskModel>.from(map['allTasks']?.map((x) => TaskModel.fromMap(x))),
      removedTasks: List<TaskModel>.from(map['removedTasks']?.map((x) => TaskModel.fromMap(x))),
    );
  }
}
