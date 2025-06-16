import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class AppTheme {
  AppTheme._();

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: TStyles.font,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    colorScheme: const ColorScheme.light(primary: TColors.black),
    scaffoldBackgroundColor: TColors.bg,
  );
}
