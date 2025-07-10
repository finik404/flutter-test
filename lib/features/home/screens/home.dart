import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/canvas/screens/canvas.dart';
import 'package:tproject/features/gemini/screens/gemini.dart';
import 'package:tproject/features/home/controllers/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

    return MainLayout(
      label: 'Test tech:',
      child: UIList(
        length: c.items.length,
        child: (index) => UIClickItem(label: c.items[index].label, screen: c.items[index].value),
      ),
    );
  }
}
