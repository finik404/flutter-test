import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class UISkeleton extends StatelessWidget {
  const UISkeleton({
    super.key,
    this.width,
    this.height = 18,
    this.radius = TStyles.radius,
  });

  final double? width;
  final double height, radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: TColors.bg,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
