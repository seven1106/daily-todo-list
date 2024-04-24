import 'package:bloc/bloc.dart';
import 'package:daily_todo_list/blocs/bloc_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
    on<RemoveTask>(_removeTask);
  }
  _addTask(AddTask event, Emitter<TasksState> emit) {
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  _updateTask(UpdateTask event, Emitter<TasksState> emit) {
    final task = event.task;
    final state = this.state;
    final index = state.allTasks.indexOf(task);
    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));
    emit(TasksState(allTasks: allTasks));
  }

  _deleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  _removeTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
