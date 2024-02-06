import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:quiz_app/core/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appThemeData,
      title: "Quiz App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
