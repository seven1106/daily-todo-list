import 'package:daily_todo_list/screens/main_screen.dart';
import 'package:daily_todo_list/screens/bin_screen.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';

class MainDrawer extends StatelessWidget {
  final screenId;

  const MainDrawer({super.key, required this.screenId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(),
                child: Text('Daily Todo List', style: TextStyle(fontSize: 24)),
              ),
              ListTile(
                title: const Text('Main'),
                trailing: Text('${state.allTasks.length}'),
                onTap: () {
                  if (screenId != MainScreen.id) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(MainScreen.id, (route) => false);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: const Text('Bin'),
                trailing: Text('${state.removedTasks.length}'),
                onTap: () {
                  if (screenId != BinScreen.id) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(BinScreen.id, (route) => false);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
