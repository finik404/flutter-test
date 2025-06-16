import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get themeData => Theme.of(this).colorScheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get bg => Theme.of(this).scaffoldBackgroundColor;
}
