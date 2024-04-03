import 'package:flutter/material.dart';

/// Black semi-transparent black background container for text
class TextBlackBackground extends StatelessWidget {
  /// Creates TextBlackBackground instance
  // ignore: use_super_parameters
  const TextBlackBackground({required this.child, Key? key}) : super(key: key);

  /// Text widget to place on background
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
