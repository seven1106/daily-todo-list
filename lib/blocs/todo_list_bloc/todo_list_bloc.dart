import 'package:equatable/equatable.dart';
import '../../models/todo_list.dart';
import '../bloc_exports.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends HydratedBloc<TodoListEvent, TodoListState>  {
  TodoListBloc() : super(const TodoListState()){
    on<AddTodoList>(_addTodoList);
    on<UpdateTodoList>(_updateTodoList);
    on<DeleteTodoList>(_deleteTodoList);
    on<RemoveTodoList>(_removeTodoList);
  }

  @override
  TodoListState? fromJson(Map<String, dynamic> json) {
    return TodoListState.fromMap(json);
  }
  void _addTodoList(AddTodoList event, Emitter<TodoListState> emit) {
    emit(TodoListState(allTodoList: List.from(state.allTodoList)..add(event.todoList)));
  }
  void _updateTodoList(UpdateTodoList event, Emitter<TodoListState> emit) {
    final todoList = event.todoList;
    final state = this.state;
    final index = state.allTodoList.indexOf(todoList);
    List<ToDoListModel> allTodoList = List.from(state.allTodoList)..remove(todoList);
    todoList.isDone == false
        ? allTodoList.insert(index, todoList.copyWith(isDone: true))
        : allTodoList.insert(index, todoList.copyWith(isDone: false));
    emit(TodoListState(allTodoList: allTodoList));
  }
  void _deleteTodoList(DeleteTodoList event, Emitter<TodoListState> emit) {
    final state = this.state;
    emit(TodoListState(removedTodoList: List.from(state.removedTodoList)..remove(event.todoList)));
  }
  void _removeTodoList(RemoveTodoList event, Emitter<TodoListState> emit) {
    final state = this.state;
    emit(
      TodoListState(
        allTodoList: List.from(state.allTodoList)..remove(event.todoList),
        removedTodoList: List.from(state.removedTodoList)
          ..add(event.todoList.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(TodoListState state) {
    return state.toMap();
  }


}
