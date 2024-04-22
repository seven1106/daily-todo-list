import 'package:flutter/material.dart';

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
        return ListTile(
          title: Text(tasks[index].title),
          trailing: Checkbox(
            value: tasks[index].isDone,
            onChanged: (value) {
              tasks[index] = tasks[index].copyWith(isDone: value);
            },
          ),
        );
      },
        itemCount: tasks.length,
        shrinkWrap: true,
      ),
    );
  }
}
