import 'dart:ui';

import 'package:flutter/foundation.dart';

class LanguageProvider extends ChangeNotifier {
  Locale locale;

  changeLang(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }
}
