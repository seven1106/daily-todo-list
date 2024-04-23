import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone ??= false;
    isDeleted ??= false;
  }
  TaskModel copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        isDone,
        isDeleted,
      ];
}
