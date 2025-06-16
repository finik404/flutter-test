import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/extensions/media.dart';

class UIConfirm extends StatelessWidget {
  const UIConfirm(
    this.title, {
    super.key,
    this.text,
    this.width,
    this.close,
  });

  final String title;
  final String? text;
  final double? width;
  final Function()? close;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? context.screenWidth * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(TStyles.radius), color: TColors.white),
        padding: TStyles.pd,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            UIText(title, styles: const TextStyle(fontWeight: FontWeight.bold), align: TextAlign.center),
            SizedBox(height: text != null ? 15 : 30),

            // Text
            if (text != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText(
                    text!,
                    align: TextAlign.center,
                    styles: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: TColors.gray),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            // Btn
            UIButton(
              'OK',
              () {
                if (close != null) close!();
                Navigator.pop(context);
              },
              textStyles: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
