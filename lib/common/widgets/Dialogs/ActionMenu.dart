import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/List.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/extensions/media.dart';

class UIActionMenu extends StatelessWidget {
  const UIActionMenu({
    super.key,
    this.actions,
    this.content,
    this.label,
    this.padding,
    this.hasScroll = false,
    this.height,
    this.borderRadius,
    this.bg,
  });

  final List<ActionModel>? actions;
  final Widget? content;
  final String? label;
  final EdgeInsets? padding;
  final bool hasScroll;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? bg;

  @override
  Widget build(BuildContext context) {
    // Content
    Widget contentWidget = Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(15, 24, 15, 24),
      child:

          // Actions
          actions != null
              ? UIList(
                  hasScroll: false,
                  length: actions!.length,
                  padding: const EdgeInsets.all(0),
                  spaceBetween: 5,
                  child: (index) {
                    // Action
                    return actions![index].isShow
                        ? UIClickArea(
                            onTap: () {
                              actions![index].onTap();
                              if (!actions![index].noPop) Navigator.pop(context);
                            },
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            child: Row(
                              children: [
                                if (actions![index].icon != null)
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: UIIcon(actions![index].icon!, size: 18),
                                  ),
                                Expanded(child: UIText(actions![index].label, size: 16)),
                              ],
                            ),
                          )
                        : Container();
                  },
                )

              // Custom content
              : content!,
    );

    // Layout
    Widget layout = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: context.screenWidth,
          decoration: BoxDecoration(color: bg, borderRadius: borderRadius ?? BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Label
              if (label != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: context.screenWidth,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: TColors.black.withValues(alpha: 0.2)),
                      ),
                    ),
                    child: UIText(
                      label!,
                      size: 14,
                      align: TextAlign.center,
                    ),
                  ),
                ),

              // With scroll
              hasScroll || height != null ? Expanded(child: SingleChildScrollView(child: contentWidget)) : contentWidget,
            ],
          ),
        ),

        // Indicator
        Positioned(
          top: -10,
          left: context.screenWidth / 2 - 75 / 2,
          child: Container(
            width: 75,
            height: 4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: TColors.bg),
          ),
        ),
      ],
    );

    // Limit height
    return hasScroll || height != null ? FractionallySizedBox(heightFactor: height ?? 0.7, child: layout) : layout;
  }
}

// Type
class ActionModel {
  final String label;
  final Function() onTap;
  final String? icon;
  final bool noPop;
  final bool isShow;

  ActionModel({
    required this.label,
    required this.onTap,
    this.icon,
    this.noPop = false,
    this.isShow = true,
  });
}
