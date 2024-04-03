import 'package:flutter/painting.dart';

/// Extension for Color class to provide user-friendly string of color
extension ColorDisplayExt on Color {
  /// Returns String with RGB values of color
  String get displayValue => "Color(R:$red, G:$green, B:$blue)";
}
