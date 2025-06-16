import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';

class UITag extends StatelessWidget {
  const UITag(
    this.label, {
    super.key,
    this.labelColor = TColors.white,
  });

  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: TColors.primary),
      child: UIText(label, color: labelColor),
    );
  }
}
