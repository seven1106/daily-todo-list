import 'package:daily_todo_list/blocs/bloc_exports.dart';
import 'package:daily_todo_list/models/todo_list.dart';
import 'package:equatable/equatable.dart';

import '../../models/day.dart';

part 'day_event.dart';
part 'day_state.dart';

class DayBloc extends HydratedBloc<DayEvent, DayState> {
  DayBloc() : super(DayInitial()) {
    on<AddTodoListDay>(_addDay);
    on<UpdateDay>(_updateDay);
    on<DeleteDay>(_deleteDay);
  }
  _addDay(AddTodoListDay event, Emitter<DayState> emit) {
    final state = this.state;
    final day = DayModel(
      id: event.id,
      todoList: [event.todoList],
      noteListId: [],
      createdAt: DateTime.now(),
    );
    if (!state.allDays.any((existingDay) => existingDay.id == day.id)) {
      emit(DayState(allDays: List.from(state.allDays)..add(day)));
    } else {
      final currentDay = state.allDays.firstWhere((element) => element.id == day.id);
      final index = state.allDays.indexWhere((element) => element.id == day.id);
      final updatedDay = currentDay.copyWith(
        todoList: [...currentDay.todoList, event.todoList],
      );
      List<DayModel> allDays = List.from(state.allDays)..remove(currentDay);
      allDays.insert(index, updatedDay);
      emit(DayState(allDays: allDays));
    }
  }

  _updateDay(UpdateDay event, Emitter<DayState> emit) {
    final day = event.day;
    final state = this.state;
    final index = state.allDays.indexOf(day);
    List<DayModel> allDays = List.from(state.allDays)..remove(day);
    allDays.insert(index, day);
    emit(DayState(allDays: allDays));
  }

  _deleteDay(DeleteDay event, Emitter<DayState> emit) {
    final state = this.state;
    emit(DayState(removedDays: List.from(state.removedDays)..add(event.day)));
  }

  @override
  DayState? fromJson(Map<String, dynamic> json) {
    return DayState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DayState state) {
    return state.toMap();
  }
}
