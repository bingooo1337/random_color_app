import 'package:flutter/material.dart';
import 'package:random_color_app/service/color_generator.dart';

class BackgroundColor with ChangeNotifier {
  final ColorGenerator _colorGenerator;
  Color _value = Colors.white;

  Color get value => _value;

  BackgroundColor({required ColorGenerator colorGenerator})
      : _colorGenerator = colorGenerator;

  void updateColor() {
    final newColor = _colorGenerator.getColor();
    if (_value == newColor) {
      return;
    }

    _value = newColor;
    notifyListeners();
  }
}
