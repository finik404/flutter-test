import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/helpers/device.dart';

class UIText extends StatelessWidget {
  const UIText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.styles,
    this.align = TextAlign.start,
    this.lineHeight,
    this.isOverflow = false,
    this.lines,
    this.isDecoration = false,
    this.hasParse = false,
  });

  final String text;
  final double? size, lineHeight;
  final FontWeight? weight;
  final Color? color;
  final TextStyle? styles;
  final TextAlign align;
  final bool isOverflow, isDecoration;
  final int? lines;
  final bool hasParse;

  @override
  Widget build(BuildContext context) {
    bool isCropped = isOverflow || lines != null;

    // Default styles
    TextStyle textStyles = TStyles.textStyles;

    // Styles
    TextStyle textStyle = textStyles.copyWith(
      fontFamily: TStyles.font,
      fontSize: size ?? textStyles.fontSize,
      fontWeight: weight ?? textStyles.fontWeight,
      color: color ?? textStyles.color,
      height: lineHeight ?? textStyles.height,
      decoration: isDecoration ? TextDecoration.underline : TextDecoration.none,
      decorationColor: isDecoration ? (color ?? textStyles.color) : null,
    );

    // Styles for the ₸ symbol
    TextStyle symbolStyle = textStyle.copyWith(
      fontFamily: TDevice.isIOS() ? 'SF Pro' : 'Roboto',
    );

    // Parse text
    if (hasParse) {
      List<TextSpan> parseText(String inputText) {
        List<TextSpan> spans = [];
        StringBuffer buffer = StringBuffer();

        for (int i = 0; i < inputText.length; i++) {
          if (inputText[i] == '₸') {
            // Add the previous text (if any) with the default style
            if (buffer.isNotEmpty) {
              spans.add(TextSpan(text: buffer.toString(), style: textStyle));
              buffer.clear();
            }
            // Add the ₸ symbol with the special style
            spans.add(TextSpan(text: '₸', style: symbolStyle));
          } else {
            buffer.write(inputText[i]);
          }
        }

        // Add any remaining text after the last ₸ symbol
        if (buffer.isNotEmpty) {
          spans.add(TextSpan(text: buffer.toString(), style: textStyle));
        }

        return spans;
      }

      // Parsed text
      return Text.rich(
        TextSpan(children: parseText(text)),
        textAlign: align,
        maxLines: lines,
        overflow: isCropped ? TextOverflow.ellipsis : TextOverflow.clip,
      );
    } else {
      // Text
      return Text(
        text,
        style: textStyle.merge(styles),
        textAlign: align,
        maxLines: lines,
        overflow: isCropped ? TextOverflow.ellipsis : TextOverflow.clip,
      );
    }
  }
}
