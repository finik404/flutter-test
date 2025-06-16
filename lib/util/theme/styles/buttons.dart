import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class TButtonsThemes {
  TButtonsThemes._();

  static ElevatedButtonThemeData Function({EdgeInsets? padding}) buttonTheme = ({EdgeInsets? padding}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: padding ?? const EdgeInsets.all(15),
        backgroundColor: TColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: TStyles.br),
        textStyle: TStyles.textStyles,
        shadowColor: Colors.transparent,
      ),
    );
  };

  static ElevatedButtonThemeData Function({EdgeInsets? padding}) buttonSecondaryTheme = ({EdgeInsets? padding}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(11),
        backgroundColor: TColors.primary.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(borderRadius: TStyles.br),
        textStyle: TStyles.textStyles,
        shadowColor: Colors.transparent,
      ),
    );
  };
}
