import 'package:daily_todo_list/models/task.dart';
import 'package:daily_todo_list/services/guid_gen.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../widgets/gradient_btn.dart';

class CreateNewTodoList extends StatefulWidget {
  static const id = 'create_new_todo_list';
  const CreateNewTodoList({Key? key}) : super(key: key);

  @override
  _CreateNewTodoListState createState() => _CreateNewTodoListState();
}

class _CreateNewTodoListState extends State<CreateNewTodoList> {
  TextEditingController taskTitleController = TextEditingController();
  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create New Keep'),
          ),
          body: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                autofocus: true,
                controller: taskTitleController,
                decoration: const InputDecoration(
                  label: Text('Title', style: TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
              GradientBtn(
                  buttonText: 'Add task',
                  onPressed: () {
                    var task = TaskModel(
                      id: GUIDGen.generate(),
                      title: taskTitleController.text,
                      isDone: false,
                    );
                    BlocProvider.of<TasksBloc>(context).add(AddTask(
                      task: task,
                    ));
                    Navigator.pop(context);
                  }),
            ],
          ),
        );
      },
    );
  }
}
