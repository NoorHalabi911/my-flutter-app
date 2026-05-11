import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

/// Password line with length rule + visibility toggle.
class AuthPasswordTextField extends StatelessWidget {
  const AuthPasswordTextField({
    super.key,
    required this.controller,
    required this.isPasswordObscured,
    required this.onToggleVisibility,
    this.hintText = 'Password',
  });

  final TextEditingController controller;
  final bool isPasswordObscured;
  final VoidCallback onToggleVisibility;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: TextFormField(
        controller: controller,
        obscureText: isPasswordObscured,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value ?? '').length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.hintSoft),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: AppColors.checkboxAccent,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.checkboxAccent, width: 1.2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputFocusBorder,
              width: 1.4,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isPasswordObscured ? Icons.visibility : Icons.visibility_off,
              color: AppColors.checkboxAccent,
            ),
          ),
        ),
      ),
    );
  }
}
