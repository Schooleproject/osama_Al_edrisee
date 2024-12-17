import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';
import 'login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme_controller.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ThemeController()); // إضافة ThemeController
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return GetMaterialApp(
          locale: languageProvider.locale,
          supportedLocales: [
            Locale('en'), // اللغة الإنجليزية
            Locale('ar'), // اللغة العربية
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: LoginPage(), // صفحة تسجيل الدخول
        );
      },
    );
  }
}