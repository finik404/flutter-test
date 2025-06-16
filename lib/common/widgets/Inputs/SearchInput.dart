import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class UISearchInput extends UIInput {
  UISearchInput(
    super.label,
    super.value, {
    super.key,
    super.padding,
    super.isPlaceholder = true,
    super.autofocus = true,
    super.onSubmit,
    super.onChange,
  }) : super(
          prefixIcon: TIcons.search,
          prefixIconStyles: TextStyle(fontSize: 16, color: TColors.primary.withValues(alpha: 0.5)),
          suffixIcon: UIIconButton(
            TIcons.close,
            () => value.text = '',
            radius: TStyles.radius,
            styles: TextStyle(fontSize: 18, color: TColors.primary.withValues(alpha: 0.5)),
          ),
        );
}
