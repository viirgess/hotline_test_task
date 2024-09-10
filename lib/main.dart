import 'package:flutter/material.dart';
import 'package:hotline_test/screen/screen_a.dart';

Future<void> main() async {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenA(),
    ),
  );
}
