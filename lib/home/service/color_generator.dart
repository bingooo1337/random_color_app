import 'dart:math';

import 'package:flutter/painting.dart';

/// Class for providing new generated color
abstract class ColorGenerator {
  /// Returns new generated color
  Color getColor();
}

/// ColorGenerator implementation that generates random colors
class ColorGeneratorRandomImpl implements ColorGenerator {
  static const _rgbMax = 256;

  final Random _random;

  /// Creates ColorGeneratorRandomImpl instance
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
