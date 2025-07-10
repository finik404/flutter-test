import 'package:flutter/material.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/widgets/Refresh.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

import 'widgets/Header.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.label,
    required this.child,
    this.padding,
    this.bottom,
    this.hasArrow = false,
    this.hasBottomContainer = true,
    this.refresh,
  });

  final Widget child;
  final String label;
  final EdgeInsets? padding;
  final Widget? bottom;
  final Future<void> Function()? refresh;
  final bool hasArrow, hasBottomContainer;

  @override
  Widget build(BuildContext context) {
    Widget scrollContent = CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        Header(label, hasArrow: hasArrow),
        Container(
          child: SliverToBoxAdapter(
            child: Padding(padding: padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 32), child: child),
          ),
        ),
      ],
    );

    return BaseLayout(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Scrollable content
          Expanded(
            child: refresh != null
                ? UIRefresh(
                    refresh: refresh!,
                    child: scrollContent,
                  )
                : scrollContent,
          ),

          // Bottom
          if (bottom != null)
            hasBottomContainer
                ? Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: TColors.bg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: bottom!,
                  )
                : bottom!,
        ],
      ),
    );
  }
}
