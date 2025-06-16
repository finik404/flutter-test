import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/helpers/navigation/to.dart';

class UIClickItem extends StatelessWidget {
  const UIClickItem({
    super.key,
    required this.label,
    required this.icon,
    required this.screen,
    this.iconRight = TIcons.right,
  });

  final String label, icon;
  final Widget screen;
  final String iconRight;

  @override
  Widget build(BuildContext context) {
    return UIClickArea(
      radius: 12,
      onTap: () => to(screen),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17.5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: TColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UIIcon(icon, color: TColors.primary, size: 12),
                const SizedBox(width: 10),
                UIText(label, size: 12),
              ],
            ),

            // Arrow
            UIIcon(iconRight, size: 12, color: TColors.gray),
          ],
        ),
      ),
    );
  }
}
