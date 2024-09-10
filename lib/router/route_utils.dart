import 'package:flutter/material.dart';
import 'package:hotline_test/screen/screen_b.dart';

class RouteBuilder {
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const ScreenB();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset beginOffset = Offset(0.0, 1.0);
        const Offset endOffset = Offset.zero;
        const Curve curve = Curves.easeInOut;

        final Animatable<Offset> offsetTween = Tween(
          begin: beginOffset,
          end: endOffset,
        ).chain(CurveTween(curve: curve));

        final Animatable<double> scaleTween = Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: curve));

        final Animation<Offset> offsetAnimation = animation.drive(offsetTween);
        final Animation<double> scaleAnimation = animation.drive(scaleTween);

        return SlideTransition(
          position: offsetAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
