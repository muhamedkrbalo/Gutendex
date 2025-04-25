import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutendex/service_initialize.dart';
import 'core/theme/cubit/app_theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'app.dart';

void main() async {
  await ServiceInitialize.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'i18n',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      saveLocale: true,
      child: BlocProvider(
        create: (context) => AppThemeCubit()..initial(),
        child: const Gutendex(),
      ),
    ),
  );
}
