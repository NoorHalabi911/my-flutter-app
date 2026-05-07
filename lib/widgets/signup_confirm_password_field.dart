import 'package:flutter/material.dart';

class SignupConfirmPasswordField extends StatelessWidget {
  const SignupConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Confirm your password",
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock),
        ),
      ),
    );
  }
}
