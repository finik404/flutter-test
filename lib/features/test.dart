import 'package:flutter/material.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      label: '',
      hasArrow: true,
      child: UIText('Такой страницы нету!'),
    );
  }
}
