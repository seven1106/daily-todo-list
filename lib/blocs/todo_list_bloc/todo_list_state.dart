part of 'todo_list_bloc.dart';

class TodoListState extends Equatable  {
  final List<ToDoListModel> allTodoList;
  final List<ToDoListModel> removedTodoList;
  const TodoListState({
    this.allTodoList = const <ToDoListModel>[],
    this.removedTodoList = const <ToDoListModel>[],
  });
  @override
  List<Object?> get props => [allTodoList];

  Map<String, dynamic> toMap() {
    return {
      'allTodoList': allTodoList.map((x) => x.toMap()).toList(),
      'removedTodoList': removedTodoList.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoListState.fromMap(Map<String, dynamic> map) {
    return TodoListState(
      allTodoList: List<ToDoListModel>.from(map['allTodoList']?.map((x) => ToDoListModel.fromMap(x))),
      removedTodoList: List<ToDoListModel>.from(map['removedTodoList']?.map((x) => ToDoListModel.fromMap(x))),
    );
  }


}

