import 'package:flutter/material.dart';

import 'blocs/bloc_exports.dart';
import 'config/theme/theme.dart';
import 'screens/main_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeMode,
        home: const MainScreen(),
      ),
    );
  }
}
