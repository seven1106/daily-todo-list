import 'package:daily_todo_list/blocs/bloc_exports.dart';
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
      child: ListView.builder(itemBuilder: (context, index) {
        var task = tasks[index];
        return ListTile(
          title: Text(tasks[index].title),
          trailing: Checkbox(
            value: tasks[index].isDone,
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
              DeleteTask(
                task: task,
              ),
            );
          },
        );
      },
        itemCount: tasks.length,
        shrinkWrap: true,
      ),
    );
  }
}
