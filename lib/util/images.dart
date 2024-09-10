import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagesSource {
  static final logoImage = SvgPicture.network(
    'https://hotline.ua/frontend/_nuxt/img/logo-smart-shopping.b026975.svg',
    height: 100,
    placeholderBuilder: (context) => const CircularProgressIndicator(),
  );
}
