import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

/// Email line with gmail/hotmail validation (project rule).
class AuthEmailTextField extends StatelessWidget {
  const AuthEmailTextField({super.key, required this.controller});

  final TextEditingController controller;

  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@(gmail|hotmail)\.com$',
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          final email = (value ?? '').trim().toLowerCase();
          if (!_emailPattern.hasMatch(email)) {
            return 'Use a valid gmail.com or hotmail.com address';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Email ID',
          hintStyle: TextStyle(color: AppColors.hintSoft),
          prefixIcon: Icon(
            Icons.email_outlined,
            color: AppColors.checkboxAccent,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.checkboxAccent, width: 1.2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputFocusBorder,
              width: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
