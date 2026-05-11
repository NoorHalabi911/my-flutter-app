import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

/// Second password field; must match [passwordController].
class AuthPasswordConfirmTextField extends StatelessWidget {
  const AuthPasswordConfirmTextField({
    super.key,
    required this.isObscured,
    required this.onToggleVisibility,
    required this.controller,
    required this.passwordController,
  });

  final bool isObscured;
  final VoidCallback onToggleVisibility;
  final TextEditingController controller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: TextFormField(
        controller: controller,
        obscureText: isObscured,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value ?? '').isEmpty) {
            return 'Please confirm your password';
          }
          if ((value ?? '').trim() != passwordController.text.trim()) {
            return 'Passwords do not match';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          hintStyle: const TextStyle(color: AppColors.hintSoft),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: AppColors.checkboxAccent,
          ),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isObscured ? Icons.visibility : Icons.visibility_off,
              color: AppColors.checkboxAccent,
            ),
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
        ),
      ),
    );
  }
}
