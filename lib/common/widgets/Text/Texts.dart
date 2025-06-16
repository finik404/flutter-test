import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/helpers/device.dart';

class UITexts extends StatelessWidget {
  const UITexts(
    this.children, {
    super.key,
    this.styles,
    this.size,
    this.color,
    this.weight,
    this.linkColor = TStyles.linkColor,
    this.linkHasDecoration = false,
    this.lineHeight,
    this.align = TextAlign.start,
    this.hasParse = false,
  });

  final List<TextModel> children;
  final double? size, lineHeight;
  final TextStyle? styles;
  final FontWeight? weight;
  final Color? color, linkColor;
  final TextAlign align;
  final bool linkHasDecoration, hasParse;

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];

    // Default styles
    TextStyle textStyles = styles ?? TStyles.textStyles;

    // Parse text
    List<InlineSpan> parseText(String inputText, TextStyle childStyles, GestureRecognizer? recognizer) {
      List<InlineSpan> spans = [];
      StringBuffer buffer = StringBuffer();

      // Styles for the ₸ symbol
      TextStyle symbolStyle = childStyles.copyWith(
        fontFamily: TDevice.isIOS() ? 'SF Pro' : 'Roboto',
      );

      for (int i = 0; i < inputText.length; i++) {
        if (inputText[i] == '₸') {
          if (buffer.isNotEmpty) {
            spans.add(TextSpan(text: buffer.toString(), style: childStyles, recognizer: recognizer));
            buffer.clear();
          }
          spans.add(TextSpan(text: '₸', style: symbolStyle, recognizer: recognizer));
        } else {
          buffer.write(inputText[i]);
        }
      }

      if (buffer.isNotEmpty) {
        spans.add(TextSpan(text: buffer.toString(), style: childStyles, recognizer: recognizer));
      }

      return spans;
    }

    // Children
    for (var child in children) {
      // isShow
      if (!(child.isShow)) continue;

      // Base text style
      TextStyle childStyles = child.styles ??
          TextStyle(
            fontFamily: TStyles.font,
            fontSize: child.size ?? size,
            color: child.color ?? color ?? (child.onTap != null ? linkColor : textStyles.color),
            fontWeight: child.weight ?? weight,
            height: child.lineHeight ?? lineHeight,
            decoration: child.onTap != null && linkHasDecoration ? TextDecoration.underline : TextDecoration.none,
            decorationColor: child.onTap != null && linkHasDecoration ? (child.color ?? linkColor) : null,
          );

      // Link
      if (child.onTap != null) {
        TapGestureRecognizer recognizer = TapGestureRecognizer()..onTap = () => child.onTap!();
        if (hasParse) {
          textSpans.addAll(parseText(child.text, childStyles, recognizer));
        } else {
          textSpans.add(TextSpan(text: child.text, style: childStyles, recognizer: recognizer));
        }
      }

      // Default text
      else {
        if (hasParse) {
          textSpans.addAll(parseText(child.text, childStyles, null));
        } else {
          textSpans.add(TextSpan(text: child.text, style: childStyles));
        }
      }
    }

    // Texts
    return RichText(
      textAlign: align,
      text: TextSpan(children: textSpans),
    );
  }
}

// Type
class TextModel {
  final String text;
  final TextStyle? styles;
  final Color? color;
  final double? size, lineHeight;
  final FontWeight? weight;
  final Function()? onTap;
  final bool isShow;

  TextModel(
    this.text, {
    this.styles,
    this.color,
    this.size,
    this.lineHeight,
    this.weight,
    this.onTap,
    this.isShow = true,
  });
}
