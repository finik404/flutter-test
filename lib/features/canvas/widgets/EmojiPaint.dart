import 'dart:math';
import 'package:flutter/material.dart';

class EmojiPaint extends CustomPainter {
  @override
  void paint(canvas, size) {
    canvas.drawCircle(const Offset(70, 350), 85, Paint()..color = Colors.orangeAccent);
    canvas.drawCircle(const Offset(35, 320), 7, Paint()..color = Colors.black);
    canvas.drawCircle(const Offset(100, 320), 7, Paint()..color = Colors.black);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(67, 350), radius: 40),
      pi * 0.1,
      pi * 0.8,
      false,
      Paint()
        ..color = Colors.black
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
