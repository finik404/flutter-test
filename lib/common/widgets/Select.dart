import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/models/base.dart';
import 'package:tproject/util/theme/styles/selects.dart';

class UISelect extends StatelessWidget {
  const UISelect(
    this.value,
    this.onChange, {
    super.key,
    required this.items,
    this.label,
    this.labelStyles,
    this.iconStyles,
    this.styles,
    this.menuStyles,
    this.itemStyle,
    this.errors = '',
    this.isPlaceholder = false,
    this.width,
    this.padding,
  });

  final ItemModel value;
  final Function(ItemModel value) onChange;
  final List<ItemModel> items;
  final String? label;
  final TextStyle? labelStyles, iconStyles;
  final InputDecorationTheme? styles;
  final MenuStyle? menuStyles;
  final ButtonStyle? itemStyle;
  final String errors;
  final bool isPlaceholder;
  final double? width;
  final EdgeInsets? padding;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    // Styles
    InputDecorationTheme selectStyles = styles ?? TSelectsThemes.selectTheme(errors.isNotEmpty, padding: padding);

    return Column(
      children: [
        DropdownMenu(
          width: width ?? context.screenWidth - 40,

          // Value
          initialSelection: value,

          // Label
          label: isPlaceholder ? null : UIText(label!, styles: labelStyles ?? selectStyles.labelStyle),
          hintText: isPlaceholder ? label : null,

          // Styles
          inputDecorationTheme: selectStyles,

          // Icon
          trailingIcon: UIIcon(TIcons.down, styles: iconStyles ?? const TextStyle(fontSize: 16, color: TColors.primary)),
          selectedTrailingIcon: const UIIcon(TIcons.up),

          // Menu styles
          menuStyle: menuStyles ?? TSelectsThemes.selectMenuTheme,

          // Items
          dropdownMenuEntries: items.map((item) {
            return DropdownMenuEntry(value: item.value, label: item.label, style: itemStyle ?? TSelectsThemes.selectMenuItemTheme);
          }).toList(),
        ),

        // Errors
        if (errors.isNotEmpty)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 5),
                child: UIText(errors, styles: selectStyles.errorStyle),
              ),
            ],
          ),
      ],
    );
  }
}
