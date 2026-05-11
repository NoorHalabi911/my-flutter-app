import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/auth/screens/auth_login_screen.dart';
import 'package:quiz/theme/app_colors.dart';

/// Root widget: theme + GetX + first screen (login).
class QuizMaterialApplication extends StatelessWidget {
  const QuizMaterialApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.brandBlue,
      ),
      home: const AuthLoginScreen(),
    );
  }
}
