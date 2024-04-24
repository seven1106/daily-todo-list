import 'package:daily_todo_list/screens/main_screen.dart';
import 'package:daily_todo_list/screens/bin_screen.dart';
import 'package:flutter/material.dart';

import '../screens/create_new_todo_list.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BinScreen.id:
        return _materialRoute(const BinScreen());
      case CreateNewTodoList.id:
        return _materialRoute(const CreateNewTodoList());
      case MainScreen.id:
        return _materialRoute(const MainScreen());
      default:
        return _materialRoute(const MainScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
