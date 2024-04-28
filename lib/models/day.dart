import 'package:daily_todo_list/models/todo_list.dart';
import 'package:equatable/equatable.dart';

class DayModel extends Equatable {
  final String id;
  final List<ToDoListModel> todoList;
  final List<String> noteListId;
  bool? isDone;
  final DateTime createdAt;

  DayModel({
    required this.id,
    required this.todoList,
    required this.noteListId,
    this.isDone,
    required this.createdAt,
  });

  factory DayModel.fromMap(Map<String, dynamic> map) {
    return DayModel(
      id: map['id'] as String,
      todoList: map['todoList'] as List<ToDoListModel>,
      noteListId: map['noteListId'] as List<String>,
      isDone: map['isDone'] as bool?,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoList': todoList,
      'noteListId': noteListId,
      'isDone': isDone,
      'createdAt': createdAt.toIso8601String(),
    };
  }
  DayModel copyWith({
    String? id,
    List<ToDoListModel>? todoList,
    List<String>? noteListId,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return DayModel(
      id: id ?? this.id,
      todoList: todoList ?? this.todoList,
      noteListId: noteListId ?? this.noteListId,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, todoList, noteListId, isDone, createdAt];
}
