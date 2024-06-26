import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:random_color_app/home/model/home_background_color.dart';
import 'package:random_color_app/home/widget/text_black_background.dart';
import 'package:random_color_app/intl/random_color_localizations.dart';
import 'package:random_color_app/util/color_display_ext.dart';

/// HomePage with random background color implementation
class HomePage extends StatelessWidget {
  /// Creates HomePage instance
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.35),
        title: Text(RandomColorLocalizations.I.appName),
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
        context.read<HomeBackgroundColor>().updateColor();
      },
      child: Consumer<HomeBackgroundColor>(
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
          RandomColorLocalizations.I.helloThere,
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
    return Consumer<HomeBackgroundColor>(
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
              RandomColorLocalizations.I.copied,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
    }
  }
}
