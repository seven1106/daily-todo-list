import 'package:daily_todo_list/services/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:core';
import 'blocs/bloc_exports.dart';
import 'blocs/day_bloc/day_bloc.dart';
import 'blocs/todo_list_bloc/todo_list_bloc.dart';
import 'config/theme/theme.dart';
import 'screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => TasksBloc()),
    BlocProvider(create: (context) => DayBloc()),
    BlocProvider(create: (context) => TodoListBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tasks App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const MainScreen(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
