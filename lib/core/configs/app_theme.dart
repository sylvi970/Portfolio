import 'package:flutter/material.dart';
import 'package:folio/core/configs/app_core_theme.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    shadowSub: const Color(0xff2979FF).withValues(alpha: 0.1),
    primary: const Color(0xff2979FF),
    primaryLight: const Color(0xff5393FF),
    primaryDark: const Color(0xff1565C0),
    textSub: const Color(0xff141414),
    textSub2: const Color(0xff696969),
  );

  static AppCoreTheme light = _core.copyWith(
    background: const Color(0xffFAFAFA),
    backgroundSub: const Color(0xffFFFFFF),
    scaffold: const Color(0xffFFFFFF),
    scaffoldDark: const Color(0xffF0F2F5),
    text: const Color(0xff1A1C1E),
    textSub2: Colors.black.withValues(alpha: 0.45),
  );

  static LinearGradient primaryGradient = const LinearGradient(
    colors: [Color(0xff2979FF), Color(0xff00B0FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      blurRadius: 5,
      offset: const Offset(0, 2),
    ),
  ];

  static AppCoreTheme? c;

  static init(BuildContext context) {
    c = light;
  }

  static bool isDark(BuildContext context) => false;
}
