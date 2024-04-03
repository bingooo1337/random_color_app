import 'package:flutter/material.dart';
import 'package:random_color_app/home/service/color_generator.dart';

/// Stores background color value for HomePage
class HomeBackgroundColor with ChangeNotifier {
  final ColorGenerator _colorGenerator;
  Color _value = Colors.white;

  /// Current background color value
  Color get value => _value;

  /// Creates HomeBackgroundColor instance
  HomeBackgroundColor({required ColorGenerator colorGenerator})
      : _colorGenerator = colorGenerator;

  /// Updates color value with new random generated one
  void updateColor() {
    final newColor = _colorGenerator.getColor();
    if (_value == newColor) {
      return;
    }

    _value = newColor;
    notifyListeners();
  }
}
