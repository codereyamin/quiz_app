import 'package:flutter/material.dart';
import 'package:quiz_app/core/const/app_color.dart';

ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
  scaffoldBackgroundColor: AppColor.primary,
  appBarTheme:
      const AppBarTheme(backgroundColor: AppColor.primary, centerTitle: true),
);
