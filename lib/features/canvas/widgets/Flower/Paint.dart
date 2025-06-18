import 'dart:math';
import 'package:flutter/material.dart';

class FlowerPaint extends CustomPainter {
  final double progress;

  FlowerPaint(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final count = 500;
    final double scale = 6;

    for (int i = 0; i < count * progress; i++) {
      // Угол и радиус по формуле Ферма
      final angle = i * 137.5 * pi / 180; // золотой угол
      final radius = scale * sqrt(i);

      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);

      final color = HSVColor.fromAHSV(1.0, (i % 360).toDouble(), 0.8, 0.9).toColor();

      canvas.drawCircle(
        Offset(dx, dy),
        4,
        Paint()..color = color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowerPaint oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
