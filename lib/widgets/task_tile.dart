
import 'package:daily_todo_list/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';

class TasksTile extends StatelessWidget {
  const TasksTile({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,
          style: task.isDone!
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : const TextStyle()),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(
            UpdateTask(
              task: task,
            ),
          );
        },
      ),
      onLongPress: () {
        context.read<TasksBloc>().add(
          RemoveTask(
            task: task,
          ),
        );
      },
    );
  }
}
