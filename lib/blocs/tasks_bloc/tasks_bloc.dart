import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
  }
  _addTask(AddTask event, Emitter<TasksState> emit) {
    final newTask = TaskModel(title: event.task.title);
    final updatedTasks = List<TaskModel>.from(state.allTasks)..add(newTask);
    emit(TasksState(allTasks: updatedTasks));
  }
  _updateTask(UpdateTask event, Emitter<TasksState> emit) {
    final updatedTasks = state.allTasks.map((task) {
      if (task == event.task) {
        return event.task;
      }
      return task;
    }).toList();
    emit(TasksState(allTasks: updatedTasks));
  }
  _deleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final updatedTasks = state.allTasks.map((task) {
      if (task == event.task) {
        return task.copyWith(isDeleted: true);
      }
      return task;
    }).toList();
    emit(TasksState(allTasks: updatedTasks));
  }
}
