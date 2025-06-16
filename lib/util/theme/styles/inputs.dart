import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class TInputsThemes {
  TInputsThemes._();

  static InputDecorationTheme Function(bool hasError) inputTheme = (hasError) {
    return InputDecorationTheme(
      fillColor: Colors.transparent,
      labelStyle: TextStyle(fontSize: 14, color: hasError ? TColors.error.withValues(alpha: 0.5) : TColors.primary.withValues(alpha: 0.5)),
      hintStyle: TextStyle(fontSize: 14, color: hasError ? TColors.error.withValues(alpha: 0.5) : TColors.primary.withValues(alpha: 0.5)),
      enabledBorder: OutlineInputBorder(
        borderRadius: TStyles.br,
        borderSide: BorderSide(width: 1, color: hasError ? TColors.lightenError : TColors.primary2.withValues(alpha: 0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: TStyles.br,
        borderSide: BorderSide(width: 1, color: hasError ? TColors.error : TColors.primary2),
      ),
      errorStyle: const TextStyle(fontSize: 12, color: TColors.error),
    );
  };
}
