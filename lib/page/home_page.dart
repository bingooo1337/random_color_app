import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_color_app/model/background_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.35),
        title: const Text(
          'Random Color App',
          style: TextStyle(color: Colors.white),
        ),
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
          )
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
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Hello There',
            style: (Theme.of(context).textTheme.titleLarge ?? const TextStyle())
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
