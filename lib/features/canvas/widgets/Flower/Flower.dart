import 'package:flutter/material.dart';
import 'package:tproject/features/canvas/widgets/Flower/Paint.dart';

class SpiralFlowerWidget extends StatefulWidget {
  @override
  _SpiralFlowerWidgetState createState() => _SpiralFlowerWidgetState();
}

class _SpiralFlowerWidgetState extends State<SpiralFlowerWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 6))..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => CustomPaint(
        painter: FlowerPaint(_animation.value),
        size: const Size(250, 250),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}