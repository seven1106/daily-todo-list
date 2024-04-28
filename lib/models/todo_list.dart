import 'package:daily_todo_list/models/task.dart';
import 'package:equatable/equatable.dart';

class ToDoListModel extends Equatable {
  final String title;
  final String id;
  final List<TaskModel> tasks;

  bool? isDone;
  bool? isDeleted;

  @override
  List<Object?> get props => [
        title,
        id,
        tasks,
        isDone,
        isDeleted,
      ];

  ToDoListModel({
    required this.title,
    required this.id,
    required this.tasks,
    this.isDone,
    this.isDeleted,
  }) {
    isDone ??= false;
    isDeleted ??= false;
  }

  ToDoListModel copyWith({
    String? title,
    String? id,
    List<TaskModel>? tasks,
    bool? isDone,
    bool? isDeleted,
  }) {
    return ToDoListModel(
      title: title ?? this.title,
      id: id ?? this.id,
      tasks: tasks ?? this.tasks,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'tasks': tasks,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory ToDoListModel.fromMap(Map<String, dynamic> map) {
    return ToDoListModel(
      title: map['title'] as String,
      id: map['id'] as String,
      tasks: map['tasks'] as List<TaskModel>,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }
}
