import 'package:daily_todo_list/models/day.dart';
import 'package:daily_todo_list/screens/create_new_todo_list.dart';
import 'package:daily_todo_list/screens/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../blocs/bloc_exports.dart';
import '../blocs/day_bloc/day_bloc.dart';
import '../core/constants/constants.dart';
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
    return BlocBuilder<DayBloc, DayState>(
      builder: (context, state) {
        List<DayModel> daysList = state.allDays;
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
          body: daysList.isEmpty
              ? Container(
                  padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(Constants.yogaPath, width: 300, height: 300),
                        const Text(
                          'Your Keep Will Appear Here',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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

                        TasksList(tasks: daysList),
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
                  onPressed: () {
                    _navigateToCreateToDo(context);
                  },
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                ),
        );
      },
    );
  }
}
