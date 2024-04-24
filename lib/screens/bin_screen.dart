import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/bloc_exports.dart';
import '../core/constants/constants.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'main_drawer.dart';

class BinScreen extends StatelessWidget {
  const BinScreen({Key? key}) : super(key: key);
  static const id = 'recycle_bin';

  displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
  builder: (context, state) {
    List<TaskModel> removedTasks = state.removedTasks;
    return Scaffold(
      endDrawer: const MainDrawer(screenId: BinScreen.id,),
      appBar: AppBar(
        title: const Text('Recycle Bin'),
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
      body: Stack(
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
              TasksList(tasks: removedTasks),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(Constants.leafDecorPath,
                width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
          ),
        ],
      ),
    );
  },
);
  }

}
