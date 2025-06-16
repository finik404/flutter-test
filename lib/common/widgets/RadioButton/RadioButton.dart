import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/RadioButton/Radio.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';

class UIRadioButton extends StatelessWidget {
  const UIRadioButton(
    this.radio, {
    super.key,
    this.spaceBetween = 15,
    this.clickRadius = 5,
    this.clickPadding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.isRightRadio = false,
    this.isFullWidth = false,
    this.labelStyles,
    this.size,
    this.thumbSize,
    this.borderWidth,
    this.color = TColors.primary,
    this.activeColor,
  });

  final Rx<RadioModel> radio;
  final double spaceBetween;
  final double clickRadius;
  final EdgeInsets clickPadding;
  final bool isRightRadio, isFullWidth;
  final TextStyle? labelStyles;
  final double? size, thumbSize, borderWidth;
  final Color? color, activeColor;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool hasLabel = radio.value.label != null;

        Widget radioWidget = UIRadio(
          radio.value.isChecked,
          size: size,
          thumbSize: thumbSize,
          borderWidth: borderWidth,
          color: color,
          activeColor: activeColor,
        );

        return UIClickArea(
          // Click options
          radius: clickRadius,
          padding: clickPadding,

          // onTap
          onTap: () {
            radio.value = RadioModel(
              label: radio.value.label,
              value: radio.value.value,
              isChecked: !radio.value.isChecked,
            );
          },

          // Content
          child: Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              // Left radio
              if (!isRightRadio)
                Container(
                  margin: EdgeInsets.only(right: hasLabel ? spaceBetween : 0),
                  child: radioWidget,
                ),

              if (hasLabel) UIText(radio.value.label!, styles: labelStyles),

              // Right radio
              if (isRightRadio)
                Container(
                  margin: EdgeInsets.only(left: hasLabel ? spaceBetween : 0),
                  child: radioWidget,
                ),
            ],
          ),
        );
      },
    );
  }
}

// Type
class RadioModel {
  final String? label;
  dynamic value;
  bool isChecked;

  RadioModel({
    this.label,
    this.value,
    required this.isChecked,
  });
}
