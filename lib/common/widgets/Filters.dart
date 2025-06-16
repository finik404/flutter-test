import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/List.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/models/base.dart';

class UIFilters extends StatelessWidget {
  const UIFilters(
    this.list, {
    super.key,
  });

  final Rx<List<FilterModel>> list;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => UIList(
        height: 40,
        length: list.value.length,
        hasScroll: true,
        direction: Axis.horizontal,
        spaceBetween: 12,
        child: (index) {
          return UIClickArea(
            onTap: () {
              final updatedFilters = list.value.map((filter) {
                return filter == list.value[index] ? filter.copyWith(active: true) : filter.copyWith(active: false);
              }).toList();

              list.value = updatedFilters;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: TStyles.br,
                border: Border.all(color: list.value[index].active ? TColors.primary : TColors.black, width: 1),
                color: list.value[index].active ? TColors.primary : TColors.bg,
              ),
              child: UIText(list.value[index].label, lineHeight: 1.5, color: list.value[index].active ? TColors.white : TColors.black, size: 12),
            ),
          );
        },
      ),
    );
  }
}
