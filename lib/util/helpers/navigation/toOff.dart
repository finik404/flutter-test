import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toOff(Widget screen, {bool isOne = false}) {
  if (isOne) {
    Get.off(screen, transition: Transition.cupertino);
  } else {
    Get.offAll(screen, transition: Transition.cupertino);
  }
}
