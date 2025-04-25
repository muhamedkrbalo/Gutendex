import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_routers_import.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/style.dart';
import 'package:easy_localization/easy_localization.dart';

class Gutendex extends StatefulWidget {
  const Gutendex({super.key});

  @override
  State<Gutendex> createState() => _GutendexState();
}

class _GutendexState extends State<Gutendex> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: appThemeData(context),
            initialRoute: RoutesName.homeScreen,
            onGenerateRoute: AppRouters.onGenerateRoute,
            navigatorKey: AppRouters.navigatorKey,
          );
        });
  }
}
