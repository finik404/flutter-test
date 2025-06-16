import 'package:flutter/material.dart';

extension MediaExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get pd => 16;

  double get pd2 => 32;
}
