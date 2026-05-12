import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeMap = {
  "dark": ThemeMode.dark,
  "light": ThemeMode.light,
};

class AppProvider extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  bool get isDark => state == ThemeMode.dark;
  ThemeMode get themeMode => state;

  void init() async {
    final prefs = await SharedPreferences.getInstance();

    String? stringTheme = prefs.getString('theme');

    ThemeMode? theme =
        stringTheme == null ? ThemeMode.light : themeMap[stringTheme];

    if (theme == null) {
      await prefs.setString(
          'theme', ThemeMode.light.toString().split(".").last);

      state = ThemeMode.light;
      return;
    }
    state = theme;
  }

  void setTheme(ThemeMode newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state == newTheme) {
      return;
    }
    state = newTheme;

    await prefs.setString(
      'theme',
      newTheme.toString().split('.').last,
    );
  }
}

final appProviderProv = NotifierProvider<AppProvider, ThemeMode>(AppProvider.new);
