import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xff2979FF),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff2979FF),
    brightness: Brightness.light,
  ),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xff2979FF),
  scaffoldBackgroundColor: const Color(0xff050505),
  fontFamily: fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff2979FF),
    brightness: Brightness.dark,
    surface: const Color(0xff121212),
  ),
);
