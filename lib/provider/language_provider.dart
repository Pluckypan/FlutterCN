import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/storage/mmkv.dart';
import 'package:fluttercn/generated/i18n.dart';

class LanguageProvider extends ChangeNotifier {
  bool chinese = true;

  LanguageProvider() {
    MMKV.getValue<bool>("AppLanguage").then((chinese) {
      changeLang(chinese != null && chinese, save: false);
    });
  }

  changeLang(bool chinese, {bool save = true}) {
    this.chinese = chinese;
    notifyListeners();
    if (save) {
      MMKV.setValue("AppLanguage", chinese);
    }
  }

  Locale getLocale() {
    var index = chinese ? 1 : 0;
    return S.delegate.supportedLocales[index];
  }

  String getLanguageName(BuildContext context) {
    return chinese ? S.of(context).simple_chinese : S.of(context).english;
  }
}
