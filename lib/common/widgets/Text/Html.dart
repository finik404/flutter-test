import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/helpers/external.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as html_dom;

class UIHtml extends StatelessWidget {
  const UIHtml(
    this.text, {
    super.key,
    this.styles,
    this.size,
    this.color,
    this.weight,
    this.lineHeight,
    this.linkColor = TStyles.linkColor,
    this.lines,
    this.hasDecoration = false,
  });

  final String text;
  final TextStyle? styles;
  final double? size, lineHeight;
  final Color? color, linkColor;
  final FontWeight? weight;
  final int? lines;
  final bool hasDecoration;

  @override
  Widget build(BuildContext context) {
    // Styles
    TextStyle textStyles = styles ?? TStyles.textStyles;

    // Parsed text
    List<TextSpan> textSpans = parseHtml(text, textStyles);

    return RichText(
      text: TextSpan(
        children: textSpans,
        style: styles ??
            TextStyle(
              fontFamily: TStyles.font,
              fontSize: size ?? textStyles.fontSize,
              fontWeight: weight ?? textStyles.fontWeight,
              color: color ?? textStyles.color,
              height: lineHeight,
            ),
      ),
      maxLines: lines,
      overflow: lines != null ? TextOverflow.ellipsis : TextOverflow.clip,
    );
  }

  // Parse html
  List<TextSpan> parseHtml(String html, TextStyle textStyles) {
    final document = html_parser.parse(html);
    final List<TextSpan> spans = [];

    // Parse
    document.body?.nodes.forEach((node) {
      if (node.nodeType == html_dom.Node.TEXT_NODE) {
        spans.add(TextSpan(text: node.text));
      }

      // Link
      else if (node is html_dom.Element) {
        if (node.localName == 'a') {
          final url = node.attributes['href'] ?? '';
          final linkText = node.text;

          spans.add(linkWidget(linkText, url, textStyles));
        }

        // Paragraph
        else if (node.localName == 'p') {
          node.nodes.forEach((childNode) {
            if (childNode is html_dom.Text) {
              String text = childNode.text.trim().replaceAll('\r\n', ' ').replaceAll('\t', '');
              spans.add(TextSpan(text: text));
            }

            // Child link
            else if (childNode is html_dom.Element) {
              if (childNode.localName == 'a') {
                final url = childNode.attributes['href'] ?? '';
                final linkText = childNode.text.trim();

                spans.add(linkWidget(' $linkText ', url, textStyles));
              }

              // Child margin
              else if (childNode.localName == 'br') {
                spans.add(const TextSpan(text: '\n'));
              }
            }
          });
        }

        // Margin
        else if (node.localName == 'br') {
          spans.add(const TextSpan(text: '\n'));
        }
      }
    });

    return spans;
  }

  TextSpan linkWidget(String linkText, String url, TextStyle textStyles) {
    return TextSpan(
      text: linkText,
      style: TextStyle(
        color: linkColor,
        decoration: hasDecoration ? TextDecoration.underline : TextDecoration.none,
        decorationColor: hasDecoration ? (color ?? textStyles.color) : null,
      ),
      recognizer: TapGestureRecognizer()..onTap = () => TExternal.launchWebUrl(url),
    );
  }
}
