import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Disabled.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/theme/styles/buttons.dart';

class UIButton extends StatelessWidget {
  const UIButton(
    this.label,
    this.onTap, {
    super.key,
    this.styles,
    this.padding,
    this.onLongTap,
    this.isDisabled,
    this.textStyles,
    this.icon,
    this.customIcon,
    this.iconStyles,
    this.spaceBetween = 12,
    this.isRightIcon = false,
    this.isFullWidth = true,
  });

  final String label;
  final Function() onTap;
  final Function()? onLongTap;
  final ButtonStyle? styles;
  final EdgeInsets? padding;
  final TextStyle? textStyles, iconStyles;
  final String? icon;
  final Widget? customIcon;
  final double spaceBetween;
  final bool isRightIcon, isFullWidth;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyles = TButtonsThemes.buttonTheme(padding: padding).style!;

    Widget button = ElevatedButton(
      // onTap
      onPressed: onTap,
      onLongPress: onLongTap,

      // Styles
      style: styles ?? buttonStyles,

      // Content
      child: Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left icon
          if (icon != null && !isRightIcon)
            Container(
              margin: EdgeInsets.only(right: spaceBetween),
              child: customIcon ?? UIIcon(icon!, styles: iconStyles),
            ),

          // Text
          UIText(
            label,
            color: textStyles?.color ?? buttonStyles.textStyle?.resolve({})?.color,
            size: textStyles?.fontSize ?? buttonStyles.textStyle?.resolve({})?.fontSize,
            weight: textStyles?.fontWeight ?? buttonStyles.textStyle?.resolve({})?.fontWeight,
            styles: textStyles,
          ),

          // Right icon
          if (icon != null && isRightIcon)
            Container(
              margin: EdgeInsets.only(left: spaceBetween),
              child: customIcon ?? UIIcon(icon!, styles: iconStyles),
            ),
        ],
      ),
    );

    // isDisabled
    return isDisabled == true ? UIDisabled(isDisabled!, child: button) : button;
  }
}
