part of 'todo_list_bloc.dart';

class TodoListEvent extends Equatable{
  const TodoListEvent();
  @override
  List<Object?> get props => [];
}
class AddTodoList extends TodoListEvent {
  final ToDoListModel todoList;
  const AddTodoList({
    required this.todoList,
  });
  @override
  List<Object?> get props => [todoList];
}
class UpdateTodoList extends TodoListEvent {
  final ToDoListModel todoList;
  const UpdateTodoList({
    required this.todoList,
  });
  @override
  List<Object?> get props => [todoList];
}
class DeleteTodoList extends TodoListEvent {
  final ToDoListModel todoList;
  const DeleteTodoList({
    required this.todoList,
  });
  @override
  List<Object?> get props => [todoList];
}
class RemoveTodoList extends TodoListEvent {
  final ToDoListModel todoList;
  const RemoveTodoList({
    required this.todoList,
  });
  @override
  List<Object?> get props => [todoList];
}
