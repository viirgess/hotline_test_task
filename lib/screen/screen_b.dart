import 'package:flutter/material.dart';
import 'package:hotline_test/util/colors.dart';
import 'package:hotline_test/widget/animated_circular_indicator.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _rotationController;
  int maxDuration = 3;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: maxDuration),
    )..forward();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCircularIndicator(
              progressController: _progressController,
              maxDuration: maxDuration,
            ),
            const SizedBox(height: 50),
            RotationTransition(
              turns: _rotationController,
              child: const Icon(
                Icons.sync,
                size: 50,
                color: ColorsSource.brightPink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
