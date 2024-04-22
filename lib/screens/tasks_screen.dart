import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/bloc_exports.dart';
import '../core/constants/constants.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Constants.menuPath, semanticsLabel: 'Acme Logo'),
              )
            ],
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Chip(
                      label: Text(
                        'Tasks:',
                      ),
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
