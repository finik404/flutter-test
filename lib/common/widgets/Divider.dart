import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class UIDivider extends StatelessWidget {
  const UIDivider({
    super.key,
    this.height,
    this.color,
  });

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: TColors.divider);
  }
}
