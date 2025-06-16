import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';

class UIPermissionPopup extends StatelessWidget {
  const UIPermissionPopup(
    this.title,
    this.text, {
    super.key,
  });

  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            UIText(title, size: 18, weight: FontWeight.bold, align: TextAlign.center),
            const SizedBox(height: 12),

            // Text
            UIText(text, size: 16, align: TextAlign.center, color: TColors.darkenGrey),
            const SizedBox(height: 25),

            // Btn
            UIButton('Открыть настройки', () => openAppSettings()),
          ],
        ),
      ),
    );
  }
}
