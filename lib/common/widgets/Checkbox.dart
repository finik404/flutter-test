import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class UICheckbox extends StatelessWidget {
  const UICheckbox(
    this.value, {
    super.key,
    this.onChange,
    this.activeColor = TColors.primary,
    this.checkColor = TColors.primary,
    this.borderColor = TColors.primary,
    this.radius = 3,
    this.size = 20,
    this.paddingClick = TStyles.pdClick,
    this.radiusClick = 20,
    this.icon = TIcons.check,
    this.label,
    this.spaceBetween = 10,
    this.labelStyles,
  });

  final bool value;
  final Function(bool)? onChange;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final double size, radius;
  final double? radiusClick;
  final EdgeInsets? paddingClick;
  final String icon;
  final String? label;
  final TextStyle? labelStyles;
  final double? spaceBetween;

  @override
  Widget build(BuildContext context) {
    return UIClickArea(
      // onTap
      onTap: onChange != null ? () => onChange!(!value) : null,

      // Click options
      padding: paddingClick ?? (label != null ? const EdgeInsets.symmetric(vertical: 5, horizontal: 10) : TStyles.pdClick),
      radius: radiusClick ?? (label != null ? 8 : 20),

      // Content
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CheckBox
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: value ? TColors.primary : TColors.primary.withValues(alpha: 0.5), width: 2),
            ),

            // Check icon
            child: Center(
              child: value ? UIIcon(icon) : null,
            ),
          ),

          if (label != null)
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: UIText(label!, styles: labelStyles),
            )
        ],
      ),
    );
  }
}
