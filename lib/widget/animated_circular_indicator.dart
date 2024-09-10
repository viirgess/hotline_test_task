import 'package:flutter/material.dart';
import 'package:hotline_test/util/colors.dart';
import 'package:hotline_test/widget/liquid_painter.dart';
import 'package:hotline_test/widget/radial_progress_painter.dart';

class AnimatedCircularIndicator extends StatelessWidget {
  final AnimationController progressController;
  final int maxDuration;

  const AnimatedCircularIndicator({
    required this.progressController,
    required this.maxDuration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progressController,
      builder: (context, _) {
        double scaleValue = Tween<double>(begin: 0.8, end: 1.0)
            .animate(progressController)
            .value;

        return Transform.scale(
          scale: scaleValue,
          child: Container(
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
                      progressController.value * maxDuration,
                      maxDuration.toDouble(),
                    ),
                  ),
                ),
                CustomPaint(
                  painter: RadialProgressPainter(
                    value: progressController.value * maxDuration,
                    backgroundGradientColors: ColorsSource.gradientColors,
                    minValue: 0,
                    maxValue: maxDuration.toDouble(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
