import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class UIRefresh extends StatelessWidget {
  const UIRefresh({
    required this.child,
    required this.refresh,
    super.key,
  });

  final Widget child;
  final Future<void> Function() refresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      color: TColors.primary,
      backgroundColor: TColors.bg,
      child: child,
    );
  }
}
