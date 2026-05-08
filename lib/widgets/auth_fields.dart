import 'package:flutter/material.dart';

class AuthEmailField extends StatelessWidget {
  const AuthEmailField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
          final isValid = RegExp(
            r'^[a-zA-Z0-9._%+-]+@(gmail|hotmail)\.com\$',
          ).hasMatch(email);
          if (!isValid) {
            return 'Use a valid gmail.com or hotmail.com address';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Email ID',
          hintStyle: const TextStyle(color: Color(0xFF5D6D9A)),
          prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF3A5A92)),
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

class AuthPasswordField extends StatelessWidget {
  const AuthPasswordField({
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
