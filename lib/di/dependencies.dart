import 'dart:math';

import 'package:random_color_app/home/model/home_background_color.dart';
import 'package:random_color_app/home/service/color_generator.dart';

/// Class for providing dependencies
abstract class Dependencies {
  static ColorGenerator _getColorGenerator() {
    return ColorGeneratorRandomImpl(random: Random());
  }

  /// Returns BackgroundColor instance with injected ColorGenerator
  static HomeBackgroundColor getBackgroundColor() {
    return HomeBackgroundColor(colorGenerator: _getColorGenerator());
  }
}
