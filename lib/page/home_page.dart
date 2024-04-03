import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_color_app/model/background_color.dart';
import 'package:random_color_app/widget/text_black_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.35),
        title: const Text('Random Color App'),
      ),
      body: Stack(
        children: [
          const _HomeBackground(),
          Center(
            child: Padding(
              // for centering considering AppBar
              // since extendBodyBehindAppBar = true
              padding: MediaQuery.paddingOf(context),
              child: const _HelloText(),
            ),
          ),
          const Align(
            alignment: Alignment(0, 0.7),
            child: _ColorInfoText(),
          ),
        ],
      ),
    );
  }
}

class _HomeBackground extends StatelessWidget {
  // https://github.com/dart-lang/sdk/issues/49025
  // ignore: use_super_parameters
  const _HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<BackgroundColor>().updateColor();
      },
      child: Consumer<BackgroundColor>(
        builder: (_, color, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            color: color.value,
          );
        },
      ),
    );
  }
}

class _HelloText extends StatelessWidget {
  // ignore: use_super_parameters
  const _HelloText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: TextBlackBackground(
        child: Text(
          'Hello There',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

class _ColorInfoText extends StatelessWidget {
  // ignore: use_super_parameters
  const _ColorInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: TextBlackBackground(
        child: Consumer<BackgroundColor>(
          builder: (_, color, __) {
            final value = color.value;

            return Text(
              "Color(R:${value.red}, G:${value.green}, B:${value.blue})",
              style: Theme.of(context).textTheme.titleMedium,
            );
          },
        ),
      ),
    );
  }
}
