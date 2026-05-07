import 'package:flutter/material.dart';

class SignupEmailField extends StatelessWidget {
  const SignupEmailField({
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
            r'^[a-zA-Z0-9._%+-]+@(gmail|hotmail)\.com$',
          ).hasMatch(email);
          if (!isValid) {
            return 'Use a valid gmail.com or hotmail.com address';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Email ID",
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
