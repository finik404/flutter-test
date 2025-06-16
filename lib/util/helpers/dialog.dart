import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Dialogs/ActionMenu.dart';
import 'package:tproject/common/widgets/Dialogs/Confirm.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/constants/colors.dart';

class TDialog {
  static void showSnackBar(String message, {String? title, bool isError = false}) {
    Get.snackbar(
      title ?? L.of(Get.context!).error,
      message,
      shouldIconPulse: true,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: isError ? Colors.red : Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.all(20),
      icon: const UIIcon(TIcons.warning, color: Colors.white, size: 20),
    );
  }

  static void showConfirm(
    String title, {
    String? text,
    double? width,
    Function()? close,
  }) {
    showDialog(
      context: Get.context!,
      barrierColor: TColors.black.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return UIConfirm(title, text: text, width: width, close: close);
      },
    );
  }

  static void showActionMenu({
    List<ActionModel>? actions,
    Widget? content,
    String? label,
    Color? bg,
    EdgeInsets? padding,
    bool hasScroll = false,
    double? height,
    BorderRadius? borderRadius,
  }) {
    Color background = bg ?? TColors.bg;

    showModalBottomSheet(
      useSafeArea: true,
      context: Get.context!,
      barrierColor: TColors.black.withValues(alpha: 0.5),
      backgroundColor: background,
      elevation: 0,
      isScrollControlled: hasScroll || height != null,
      builder: (BuildContext context) {
        return UIActionMenu(
          actions: actions,
          content: content,
          label: label,
          padding: padding,
          borderRadius: borderRadius,
          hasScroll: hasScroll,
          height: height,
          bg: background,
        );
      },
    );
  }

  static void showToast(String message, {bool isWarning = false}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      titleText: Container(),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      barBlur: 0,
      messageText: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isWarning ? Colors.orange : Colors.green,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.2), offset: const Offset(0, 3), blurRadius: 5, spreadRadius: 1),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIIcon(isWarning ? TIcons.warning : 'f336', color: TColors.white, size: 18, weight: FontWeight.bold),
              const SizedBox(width: 10),
              UIText(message, align: TextAlign.center, color: TColors.white, size: 12, weight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}
