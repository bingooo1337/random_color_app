import 'dart:math';

import 'package:random_color_app/home/model/background_color.dart';
import 'package:random_color_app/home/service/color_generator.dart';

abstract class Dependencies {
  static ColorGenerator _getColorGenerator() {
    return ColorGeneratorRandomImpl(random: Random());
  }

  static BackgroundColor getBackgroundColor() {
    return BackgroundColor(colorGenerator: _getColorGenerator());
  }
}
