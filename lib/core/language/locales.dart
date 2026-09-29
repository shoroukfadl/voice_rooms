import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale, this._strings);

  final Locale locale;
  final Map<String, String> _strings;

  static const supportedLocales = [Locale('ar'), Locale('en')];
  static const delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static Future<AppLocalizations> load(Locale locale) async {
    final raw = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    final map = (json.decode(raw) as Map<String, dynamic>)
        .map((k, v) => MapEntry(k, v.toString()));
    return AppLocalizations(locale, map);
  }

  /// ترجمة مفتاح مع متغيّرات اختيارية: tr('codeSentTo', {'phone': '...'})
  String tr(String key, [Map<String, String>? args]) {
    var text = _strings[key] ?? key; // لو المفتاح ناقص بيظهر اسمه (سهل تلاقيه)
    args?.forEach((name, value) => text = text.replaceAll('{$name}', value));
    return text;
  }

  /// الجمع: بيدوّر على key_zero / key_one / key_two / key_few / key_many / key_other
  String plural(String key, int count) {
    final cat = _category(count);
    final text = _strings['${key}_$cat'] ?? _strings['${key}_other'] ?? key;
    return text.replaceAll('{count}', '$count');
  }

  String _category(int n) {
    if (locale.languageCode == 'ar') {
      if (n == 0) return 'zero';
      if (n == 1) return 'one';
      if (n == 2) return 'two';
      final m = n % 100;
      if (m >= 3 && m <= 10) return 'few';
      if (m >= 11) return 'many';
      return 'other';
    }
    return n == 0 ? 'zero' : (n == 1 ? 'one' : 'other');
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales
      .any((l) => l.languageCode == locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension LocalizationX on BuildContext {
  AppLocalizations get t => AppLocalizations.of(this);
}
