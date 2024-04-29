import 'package:daily_todo_list/core/utills/show_snack_bar.dart';
import 'package:daily_todo_list/models/task.dart';
import 'package:daily_todo_list/services/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/day_bloc/day_bloc.dart';
import '../models/todo_list.dart';

class CreateNewTodoList extends StatefulWidget {
  static const id = 'create_new_todo_list';
  const CreateNewTodoList({Key? key}) : super(key: key);

  @override
  _CreateNewTodoListState createState() => _CreateNewTodoListState();
}

class _CreateNewTodoListState extends State<CreateNewTodoList> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  List allTasksController = [];
  String todoId = GUIDGen.generate();
  @override
  void dispose() {
    taskTitleController.dispose();
    noteController.dispose();
    taskController.dispose();
    super.dispose();
  }

  void _addTask(BuildContext context) async {
    if (taskTitleController.text.isEmpty) {
      showSnackBar(context, 'Title cannot be empty');
      return;
    }
    var tasks = allTasksController.map((e) {
      return TaskModel(
        id: GUIDGen.generate(),
        title: e.text,
        isDone: false,
      );
    }).toList();
    var todoList = ToDoListModel(
      id: todoId,
      title: taskTitleController.text,
      note: noteController.text,
      tasks: tasks,
    );
    String today = DateFormat().add_yMMMd().format(DateTime.now());
    // BlocProvider.of<TodoListBloc>(context).add(AddTodoList(
    //   todoList: todoList,
    // ));
    BlocProvider.of<DayBloc>(context).add(AddTodoListDay(
      id: today,
      todoList: todoList,
    ));
    Navigator.pop(context);
  }

  void generateTextField() {
    TextEditingController controller = TextEditingController();
    setState(() {
      allTasksController.add(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo List', style: TextStyle(fontSize: 25)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: const Icon(Icons.check, size: 30, color: Colors.greenAccent),
              onPressed: () {
                _addTask(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${DateFormat().add_yMMMd().format(DateTime.now())}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 15),
            TextFormField(
              style: const TextStyle(fontSize: 30),
              autofocus: true,
              controller: taskTitleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 30),
              ),
              onFieldSubmitted: (value) {
                generateTextField();
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(fontSize: 25),
              controller: noteController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'note (optional)',
                hintStyle: TextStyle(fontSize: 25),
              ),
              onFieldSubmitted: (value) {
                generateTextField();
              },
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: allTasksController.length,
                  itemBuilder: (context, index) {
                    return getTextField(index, allTasksController[index]);
                  }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          generateTextField();
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget getTextField(int index, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${index + 1}.',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              style: const TextStyle(fontSize: 20),
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Task ${index + 1}',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                allTasksController.removeAt(index);
              });
            },
            icon: Icon(Icons.delete_outline, color: Colors.red[400]),
          ),
        ],
      ),
    );
  }
}
