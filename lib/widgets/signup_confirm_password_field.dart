import 'package:flutter/material.dart';

class SignupConfirmPasswordField extends StatelessWidget {
  const SignupConfirmPasswordField({
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
          if (value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: const TextStyle(color: Color(0xFF5D6D9A)),
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF3A5A92)),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isObscured ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFF3A5A92),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3A5A92), width: 1.2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2E4C80), width: 1.4),
          ),
        ),
      ),
    );
  }
}
