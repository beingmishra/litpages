import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litpages/config/theme/app_colors.dart';

class AppTheme {

  static var themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    useMaterial3: false,
    canvasColor: AppColors.scaffoldDarkColor,
    brightness: Brightness.dark,
    dividerColor: Colors.grey.shade200.withOpacity(0.6),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.scaffoldDarkColor,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}