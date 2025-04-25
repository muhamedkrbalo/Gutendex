import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension ContextExtension on BuildContext {
  double width() => MediaQuery.sizeOf(this).width;

  double height() => MediaQuery.sizeOf(this).height;

  String apiTr({
    required String ar,
    required String en,
  }) {
    String text = '';
    switch (locale.languageCode) {
      case 'ar':
        text = ar;
        break;
      case 'en':
        text = en;
        break;
    }
    return text;
  }

  bool isRTL() {
    return intl.Bidi.isRtlLanguage(locale.languageCode);
  }
}
