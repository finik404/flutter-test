import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/util/constants/styles.dart';
export 'package:tproject/util/constants/icons.dart';

class UIIconButton extends StatelessWidget {
  const UIIconButton(
    this.icon,
    this.onTap, {
    super.key,
    this.size,
    this.color,
    this.weight,
    this.onLongTap,
    this.padding = TStyles.pdClick,
    this.radius = 50,
    this.borderRadius,
    this.splashColor,
    this.bg,
    this.styles,
  });

  final String icon;
  final Function() onTap;
  final double? size;
  final FontWeight? weight;
  final Function()? onLongTap;
  final EdgeInsets padding;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? color, splashColor, bg;
  final TextStyle? styles;

  @override
  Widget build(BuildContext context) {
    return UIClickArea(
      // ClickArea options
      hasMaterial: true,
      padding: padding,
      borderRadius: borderRadius,
      radius: radius,
      bg: bg,

      // onTap
      onTap: onTap,
      onLongTap: onLongTap,
      color: splashColor,

      // Icon
      child: IntrinsicWidth(
        child: UIIcon(icon, color: color, size: size, weight: weight, styles: styles),
      ),
    );
  }
}
