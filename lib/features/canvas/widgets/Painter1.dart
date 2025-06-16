import 'package:flutter/material.dart';

class Painter1 extends CustomPainter {
  @override
  void paint(canvas, size) {
    canvas.drawCircle(Offset(75, 75), 50, Paint());
    canvas.drawLine(Offset.zero, Offset(20, 20), Paint());
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(50, 50)), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
