import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/canvas/controllers/canvas.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CanvasController());

    return MainLayout(
      label: 'Canvas',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          ],
      ),
    );
  }
}
