import 'package:flutter/material.dart';

import 'app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static _underBorder([Color color = AppPalette.borderColor]) => UnderlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'AlegreyaSans',
        ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: NoTransitionsOnPlatform(),
      TargetPlatform.iOS: NoTransitionsOnPlatform(),
      TargetPlatform.linux: NoTransitionsOnPlatform(),
      TargetPlatform.macOS: NoTransitionsOnPlatform(),
      TargetPlatform.windows: NoTransitionsOnPlatform(),
    }),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppPalette.gradient5,
      foregroundColor: AppPalette.backgroundColor,
      sizeConstraints: BoxConstraints.tightFor(
        width: 60,
        height: 60,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(AppPalette.gradient2),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.backgroundColor,
      elevation: 0,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(
        AppPalette.backgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.all(27),
      border: _border(AppPalette.gradient2),
      enabledBorder: _underBorder(AppPalette.gradient3),
      focusedBorder: _underBorder(AppPalette.gradient5),
      errorBorder: _border(AppPalette.errorColor),
    ),
  );
}

class NoTransitionsOnPlatform extends PageTransitionsBuilder {
  const NoTransitionsOnPlatform();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    // if (ModalRoute.of(context)!.isFirst) {
    //   return child;
    // }

    // Thực hiện slide animation
    return child;
    //   SlideTransition(
    //   position: Tween<Offset>(
    //     begin: const Offset(1.0, 0.0),
    //     end: Offset.zero,
    //   ).animate(animation),
    //   child: child,
    // );
  }
}

