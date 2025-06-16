import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/canvas/controllers/canvas.dart';
import 'package:tproject/features/canvas/widgets/Painter1.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CanvasController());

    return MainLayout(
      label: 'Canvas',
      hasArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            size: const Size(150, 150),
            painter: Painter1(),
          ),
        ],
      ),
    );
  }
}
