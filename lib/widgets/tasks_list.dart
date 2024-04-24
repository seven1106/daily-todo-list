import 'package:daily_todo_list/blocs/bloc_exports.dart';
import 'package:daily_todo_list/widgets/task_tile.dart';
import 'package:flutter/material.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var task = tasks[index];
          return TasksTile(task: task);
        },
        itemCount: tasks.length,
        shrinkWrap: true,
      ),
    );
  }
}
