import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class UIToggle extends StatelessWidget {
  const UIToggle(
    this.value, {
    super.key,
    this.onChange,
    this.width = 48,
    this.height = 24,
    this.color,
    this.activeColor = TColors.primary,
    this.thumbSize = 20,
    this.thumbColor = TColors.bg,
    this.thumbActiveColor = TColors.bg,
    this.sideBetween = 2,
    this.decoration,
    this.thumbDecoration,
  });

  final bool value;
  final Function()? onChange;
  final double width;
  final double height;
  final Color? color, activeColor, thumbColor, thumbActiveColor;
  final double thumbSize, sideBetween;
  final BoxDecoration? decoration, thumbDecoration;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onChange != null ? () => onChange!() : null,

      // Toggle
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        decoration: decoration ?? BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: value ? activeColor : color ?? TColors.black.withValues(alpha: 0.4),
        ),

        // Thumb
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 200),
              left: value ? null : sideBetween,
              right: value ? sideBetween : null,
              top: (height - thumbSize) / 2,
              child: Container(
                height: thumbSize,
                width: thumbSize,
                decoration: thumbDecoration ?? BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? thumbActiveColor : thumbColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
