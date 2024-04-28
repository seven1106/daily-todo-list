import 'package:daily_todo_list/models/day.dart';
import 'package:daily_todo_list/widgets/task_tile.dart';
import 'package:flutter/material.dart';
class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<DayModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var task = tasks[index];
          return TasksTile(day: task);
        },
        itemCount: tasks.length,
        shrinkWrap: true,
      ),
    );
  }
}
