part of 'day_bloc.dart';

class DayEvent extends Equatable {
  const DayEvent();
  @override
  List<Object?> get props => [];
}
class AddTodoListDay extends DayEvent {
  final String id;
  final ToDoListModel todoList;
  const AddTodoListDay({
    required this.id,
    required this.todoList,
  });
  @override
  List<Object?> get props => [id, todoList];
}
class UpdateDay extends DayEvent {
  final DayModel day;
  const UpdateDay({
    required this.day,
  });
  @override
  List<Object?> get props => [day];
}
class DeleteDay extends DayEvent {
  final DayModel day;
  const DeleteDay({
    required this.day,
  });
  @override
  List<Object?> get props => [day];
}
