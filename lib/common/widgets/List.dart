import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Refresh.dart';

class UIList extends StatelessWidget {
  const UIList({
    super.key,
    required this.length,
    required this.child,
    this.direction = Axis.vertical,
    this.hasScroll = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.spaceBetween = 12,
    this.separator,
    this.height,
    this.controller,
    this.refresh,
  });

  final int length;
  final dynamic child;
  final Axis direction;
  final bool hasScroll;
  final EdgeInsetsGeometry padding;
  final Widget? separator;
  final double spaceBetween;
  final double? height;
  final ScrollController? controller;
  final Future<void> Function()? refresh;

  @override
  Widget build(BuildContext context) {
    Widget list = ListView.separated(
      itemCount: length,
      controller: controller,
      padding: padding,

      // Scroll options
      scrollDirection: direction,
      shrinkWrap: !hasScroll,
      physics: !hasScroll ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),

      // Separator
      separatorBuilder: (context, index) {
        if (separator != null) {
          // Custom separator
          return separator!;
        } else {
          // Spacing
          return SizedBox(
            width: direction == Axis.horizontal ? spaceBetween : 0,
            height: direction == Axis.vertical ? spaceBetween : 0,
          );
        }
      },

      // Items
      itemBuilder: (context, index) {
        if (child != null) {
          if (child is Widget Function(int)) {
            return child(index);
          } else {
            return child;
          }
        }
      },
    );

    list = height != null ? SizedBox(height: height, child: list) : list;

    // List with refresh indicator
    return refresh != null ? UIRefresh(refresh: refresh!, child: list) : list;
  }
}
