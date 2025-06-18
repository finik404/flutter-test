import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class SimplePaints extends CustomPainter {
  @override
  void paint(canvas, size) {
    // Circle
    canvas.drawCircle(
      const Offset(40, 75),
      50,
      Paint()
        ..color = Colors.greenAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true,
    );

    // Line
    canvas.drawLine(
      const Offset(0, 0),
      const Offset(100, 0),
      Paint()
        ..color = Colors.blueGrey
        ..strokeWidth = 15
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
    );

    // Square
    canvas.drawRect(Rect.fromPoints(const Offset(-10, 140), const Offset(100, 240)), Paint()..color = Colors.amberAccent);

    // Text
    final builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.left,
        fontSize: 16,
      ),
    )
      ..pushStyle(ui.TextStyle(color: Colors.black))
      ..addText('Пример текста через canvas.drawParagraph');
    canvas.drawParagraph(
      builder.build()..layout(ui.ParagraphConstraints(width: size.width - 40)),
      const Offset(-10, 260),
    );

    // Points
    canvas.drawPoints(
      ui.PointMode.points,
      [const Offset(-5, 370), const Offset(15, 380), const Offset(35, 380), const Offset(55, 370)],
      Paint()
        ..color = Colors.red
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
