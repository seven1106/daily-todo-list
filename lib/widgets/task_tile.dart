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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            DateFormat().add_MMMMd().format(day.createdAt),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              var task = day.todoList[index];
              return Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      task.note,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      task.tasks.length > 1 ? '+ ${task.tasks.length} tasks' : 'Notebook',
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              );
            },
            itemCount: day.todoList.length,
            shrinkWrap: true,

          ),
        ],
      ),
    );
  }
}
