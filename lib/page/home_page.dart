import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:random_color_app/model/background_color.dart';
import 'package:random_color_app/util/color_display_ext.dart';
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
            alignment: Alignment(0, 0.6),
            child: _ColorInfoButton(),
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

class _ColorInfoButton extends StatelessWidget {
  // ignore: use_super_parameters
  const _ColorInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BackgroundColor>(
      builder: (_, color, __) {
        final colorDisplayValue = color.value.displayValue;

        return ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
          onPressed: () => _onColorPressed(context, colorDisplayValue),
          child: Text(
            color.value.displayValue,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }

  Future<void> _onColorPressed(BuildContext context, String colorText) async {
    await Clipboard.setData(ClipboardData(text: colorText));

    if (context.mounted) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'Copied!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
    }
  }
}
