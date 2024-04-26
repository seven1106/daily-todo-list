import 'package:daily_todo_list/screens/create_new_todo_list.dart';
import 'package:daily_todo_list/screens/main_drawer.dart';
import 'package:daily_todo_list/widgets/gradient_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/bloc_exports.dart';
import '../core/constants/constants.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const id = 'MainScreen';

  void _navigateToCreateToDo(BuildContext context) {
    Navigator.pushNamed(context, CreateNewTodoList.id);
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.allTasks;
        return Scaffold(
          endDrawer: const MainDrawer(screenId: MainScreen.id),
          appBar: AppBar(
            title: const Text(Constants.appName),
            actions: [
              Builder(builder: (context) {
                return IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: SvgPicture.asset(Constants.menuPath, semanticsLabel: 'menu'),
                  ),
                  onPressed: () => displayEndDrawer(context),
                );
              })
            ],
          ),
          body: tasksList.isEmpty
              ? Container(
                  padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Constants.lotusPath,
                            width: 200, height: 200, fit: BoxFit.fill),
                        const Text(
                          'WELCOME',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Do meditation. Stay focused. Live a healthy life.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        GradientBtn(
                          buttonText: 'Add new to-do list for today!',
                          onPressed: () {
                            _navigateToCreateToDo(context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Chip(
                          label: Text(
                            'Today:',
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TasksList(tasks: tasksList),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(Constants.leafDecorPath,
                          width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
                    ),
                  ],
                ),
          floatingActionButton: tasksList.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    _navigateToCreateToDo(context);
                  },
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
