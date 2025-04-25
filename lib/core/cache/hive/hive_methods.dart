import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../theme/theme_enum.dart';

class HiveMethods {
  static final _box = Hive.box('app');

  static String getLang() {
    return _box.get('lang', defaultValue: 'ar');
  }

  static void updateLang(Locale locale) {
    _box.put('lang', locale.languageCode);
  }

  static ThemeEnum getTheme() {
    return _box.get(
      'theme',
      defaultValue: ThemeEnum.light,
    );
  }

  static void updateThem(ThemeEnum theme) {
    _box.put('theme', theme);
  }
}
