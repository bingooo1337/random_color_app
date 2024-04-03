// TODO reimplement with flutter_localizations package
abstract class RandomColorLocalizations {
  static final RandomColorLocalizations _instance =
      _RandomColorLocalizationsEn();

  abstract final String appName;
  abstract final String helloThere;
  abstract final String copied;

  static RandomColorLocalizations get I => _instance;
}

class _RandomColorLocalizationsEn implements RandomColorLocalizations {
  @override
  final String appName = 'Random Color App';
  @override
  final String helloThere = 'Hello There';
  @override
  final String copied = 'Copied!';
}
