import 'package:fluttercn/provider/language_provider.dart';
import 'package:fluttercn/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ProviderManager {
  ProviderManager._();

  static final List<SingleChildCloneableWidget> providers = []
    ..add(ChangeNotifierProvider(builder: (_) => ThemeProvider()))
    ..add(
      ChangeNotifierProvider(builder: (_) => LanguageProvider()),
    );
}
