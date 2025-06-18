import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/canvas/controllers/canvas.dart';
import 'package:tproject/features/canvas/widgets/EmojiPaint.dart';
import 'package:tproject/features/canvas/widgets/Flower/Flower.dart';
import 'package:tproject/features/canvas/widgets/SimplePaints.dart';

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
          // Simple paints
          CustomPaint(
            size: const Size(150, 150),
            painter: SimplePaints(),
          ),

          // Emoji paint
          CustomPaint(
            size: const Size(85, 85),
            painter: EmojiPaint(),
          ),

          // Flower paint
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: SpiralFlowerWidget(),
          ),
        ],
      ),
    );
  }
}
