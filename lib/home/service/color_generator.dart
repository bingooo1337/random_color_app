import 'dart:math';

import 'package:flutter/painting.dart';

abstract class ColorGenerator {
  Color getColor();
}

class ColorGeneratorRandomImpl implements ColorGenerator {
  static const _rgbMax = 256;

  final Random _random;

  ColorGeneratorRandomImpl({required Random random}) : _random = random;

  @override
  Color getColor() {
    return Color.fromRGBO(
      _getRandomRGBValue(),
      _getRandomRGBValue(),
      _getRandomRGBValue(),
      1,
    );
  }

  int _getRandomRGBValue() => _random.nextInt(_rgbMax);
}
