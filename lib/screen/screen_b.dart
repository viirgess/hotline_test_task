import 'package:flutter/material.dart';
import 'package:hotline_test/widget/liquid_painter.dart';
import 'package:hotline_test/widget/radial_progress_painter.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _rotationController;
  int maxDuration = 3;
  List<Color> gradientColors = const [
    Color(0xffFF0069),
    Color(0xffFED602),
    Color(0xff7639FB),
    Color(0xffD500C5),
    Color(0xffFF7A01),
    Color(0xffFF0069),
  ];

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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _progressController,
              builder: (context, _) {
                return Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomPaint(
                          painter: LiquidPainter(
                            _progressController.value * maxDuration,
                            maxDuration.toDouble(),
                          ),
                        ),
                      ),
                      CustomPaint(
                        painter: RadialProgressPainter(
                          value: _progressController.value * maxDuration,
                          backgroundGradientColors: gradientColors,
                          minValue: 0,
                          maxValue: maxDuration.toDouble(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
            RotationTransition(
              turns: _rotationController,
              child: const Icon(
                Icons.sync,
                size: 50,
                color: Color(0xffFF0069),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
