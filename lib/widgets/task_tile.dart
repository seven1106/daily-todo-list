import 'package:daily_todo_list/models/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TasksTile extends StatelessWidget {
  const TasksTile({
    super.key,
    required this.day,
  });

  final DayModel day;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          DateFormat().add_MMMMd().format(day.createdAt),
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            var task = day.todoList[index];
            return ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isDone! ? TextDecoration.lineThrough : null,
                ),
              ),
              // subtitle: Text(task.description),
            );
          },
          itemCount: day.todoList.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
