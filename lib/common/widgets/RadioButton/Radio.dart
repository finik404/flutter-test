import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class UIRadio extends StatelessWidget {
  const UIRadio(
    this.isChecked, {
    super.key,
    this.size,
    this.thumbSize,
    this.borderWidth,
    this.color,
    this.activeColor,
  });

  final bool isChecked;
  final double? size, thumbSize, borderWidth;
  final Color? color, activeColor;

  @override
  Widget build(BuildContext context) {
    Color customColor = color ?? TColors.primary;
    Color customActiveColor = activeColor ?? TColors.primary.withValues(alpha: 0.3);

    return Stack(
      children: [
        Container(
          width: size ?? 15,
          height: size ?? 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: borderWidth ?? 1,
              color: isChecked ? customActiveColor : customColor,
            ),
          ),
        ),
        if (isChecked)
          Positioned(
            top: thumbSize ?? 5,
            left: thumbSize ?? 5,
            child: Container(
              width: thumbSize ?? 5,
              height: thumbSize ?? 5,
              decoration: BoxDecoration(shape: BoxShape.circle, color: customActiveColor),
            ),
          ),
      ],
    );
  }
}
