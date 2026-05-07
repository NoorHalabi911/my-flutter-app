import 'package:flutter/material.dart';

class SignupPasswordField extends StatelessWidget {
  const SignupPasswordField({
    super.key,
    required this.isPasswordObscured,
    required this.onToggleVisibility,
    required this.controller,
  });

  final bool isPasswordObscured;
  final VoidCallback onToggleVisibility;
  final TextEditingController controller;

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
          hintText: "Password",
          hintStyle: const TextStyle(color: Color(0xFF5D6D9A)),
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF3A5A92)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3A5A92), width: 1.2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2E4C80), width: 1.4),
          ),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isPasswordObscured ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFF3A5A92),
            ),
          ),
        ),
      ),
    );
  }
}
