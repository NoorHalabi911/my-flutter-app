import 'package:flutter/material.dart';

class SignupPasswordField extends StatelessWidget {
  const SignupPasswordField({
    super.key,
    required this.boolen,
    required this.onToggleVisibility,
  });

  final bool boolen;
  final VoidCallback onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextField(
        obscureText: boolen,
        decoration: InputDecoration(
          hintText: "Enter your password",
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              boolen ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}
