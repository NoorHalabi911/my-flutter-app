import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter your email",
          border: OutlineInputBorder(),
          icon: Icon(Icons.email),
        ),
      ),
    );
  }
}
