import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/helpers/device.dart';

class TStyles {
  TStyles._();

  // Text
  static const String font = 'Circe';
  static const TextStyle textStyles = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.black, height: 1.25);
  static const Color linkColor = TColors.primary;

  // BorderRadius
  static const double radius = 10;
  static BorderRadius br = BorderRadius.circular(radius);

  static BorderRadius brBottom(double? value) {
    return BorderRadius.only(
      topLeft: Radius.circular(value ?? radius),
      topRight: Radius.circular(value ?? radius),
    );
  }

  static BorderRadius brTop(double? value) {
    return BorderRadius.only(
      topLeft: Radius.circular(value ?? radius),
      topRight: Radius.circular(value ?? radius),
    );
  }

  // Padding
  static const EdgeInsets pd = EdgeInsets.symmetric(vertical: 16, horizontal: 27);
  static const EdgeInsets pdLg = EdgeInsets.symmetric(vertical: 32, horizontal: 27);
  static const EdgeInsets pdClick = EdgeInsets.all(10);
  static const EdgeInsets pdBg = EdgeInsets.symmetric(vertical: 20, horizontal: 20);

  // Border
  static Border bd(Color? value) => Border.all(color: value ?? TColors.divider);

  static Border bdBottom(Color? value) => Border(bottom: BorderSide(color: value ?? TColors.divider));

  static Border bdTop(Color? value) => Border(top: BorderSide(color: value ?? TColors.divider));

  // BoxShadow
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: TColors.black.withValues(alpha: 0.1),
      spreadRadius: 0,
      blurRadius: 42,
      offset: const Offset(0, 4),
    ),
  ];

  // Overlay styles
  static SystemUiOverlayStyle overlayStyles = SystemUiOverlayStyle(
    statusBarBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
    statusBarIconBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
  );
}
