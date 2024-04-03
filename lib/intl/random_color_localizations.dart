// TODO reimplement with flutter_localizations package
/// Dummy localizations holder
abstract class RandomColorLocalizations {
  static final RandomColorLocalizations _instance =
      _RandomColorLocalizationsEn();

  /// Random Color Application name
  abstract final String appName;

  /// Greeting of home page
  abstract final String helloThere;

  /// Message to display when something copied
  abstract final String copied;

  /// Return instance of RandomColorLocalizations
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
