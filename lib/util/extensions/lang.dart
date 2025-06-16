import 'package:flutter/material.dart';

extension LangExtension on BuildContext {
  String get lang => Localizations.localeOf(this).languageCode;

  bool get isRU => Localizations.localeOf(this).languageCode == 'ru';

  bool get isKZ => Localizations.localeOf(this).languageCode == 'kk';

  bool get isEN => Localizations.localeOf(this).languageCode == 'en';
}
