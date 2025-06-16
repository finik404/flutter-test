import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class UIClickArea extends StatelessWidget {
  const UIClickArea({
    super.key,
    this.onTap,
    required this.child,
    this.onLongTap,
    this.borderRadius,
    this.radius,
    this.color,
    this.padding = EdgeInsets.zero,
    this.hasMaterial = false,
    this.bg,
  });

  final Function()? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? color, bg;
  final EdgeInsets padding;
  final Function()? onLongTap;
  final bool hasMaterial;

  @override
  Widget build(BuildContext context) {
    Widget clickItem = InkWell(
      onTap: onTap,
      onLongPress: onLongTap,
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? TStyles.radius),
      splashColor: color ?? TColors.black.withValues(alpha: 0.1),
      highlightColor: color ?? TColors.black.withValues(alpha: 0.1),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? TStyles.radius),
        ),
        child: child,
      ),
    );

    return hasMaterial ? Material(color: Colors.transparent, child: clickItem) : clickItem;
  }
}
