import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';
import 'theme_controller.dart';

class UserInfoPage extends StatelessWidget {
  final String username;
  final String email;

  UserInfoPage({required this.username, required this.email});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("معلومات المستخدم"),
        actions: [
          IconButton(
            icon: Obx(() => AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Icon(
                themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                key: ValueKey<bool>(themeController.isDarkMode.value),
                size: 28,
              ),
            )),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("اسم المستخدم: $username", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("البريد الإلكتروني: $email", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                themeController.toggleTheme();
              },
              child: Obx(() => Text(
                themeController.isDarkMode.value ? "تبديل إلى الوضع الفاتح" : "تبديل إلى الوضع الداكن",
                style: TextStyle(fontSize: 18),
              )),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 30),
            // زر تغيير اللغة
            // ElevatedButton(
            //   onPressed: () {
            //     context.read<LanguageProvider>().changeLanguage('ar');
            //     Get.updateLocale(Locale('ar')); // تحديث اللغة في Get
            //   },
            //   child: Text("تغيير إلى العربية"),
            // ),
            // SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     context.read<LanguageProvider>().changeLanguage('en');
            //     Get.updateLocale(Locale('en')); // تحديث اللغة في Get
            //   },
            //   child: Text("Change to English"),
            // ),
          ],
        ),
      ),
    );
  }
}