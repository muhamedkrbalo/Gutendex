import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: AppColor.primaryColor(context),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    hintColor: AppColor.hintColor(context),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor(context),
      alignedDropdown: true,
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primaryColor(context),
      secondary: AppColor.secondAppColor(context),
      surface: AppColor.whiteColor(context),
    ),
    appBarTheme: AppBarTheme(
      color: AppColor.secondAppColor(context),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.appBarStyle(context),
      foregroundColor: AppColor.appBarTextColor(context),
    ),
    scaffoldBackgroundColor: AppColor.scaffoldColor(context),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.primaryColor(context),
    ),
    platform: TargetPlatform.iOS,
  );
}

List<BoxShadow> appShadow = [
  const BoxShadow(
    color: Color(0x3FD3D1D8),
    blurRadius: 22.5,
    offset: Offset(11.25, 11.25),
    spreadRadius: 0,
  ),
];
