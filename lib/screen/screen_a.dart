import 'package:flutter/material.dart';
import 'package:hotline_test/router/route.dart';

import 'package:hotline_test/util/images.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen A')),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImagesSource.logoImage,
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(RouteBuilder().createRoute());
              },
              child: const Text('Go to Screen B'),
            ),
          ],
        ),
      ),
    );
  }
}
