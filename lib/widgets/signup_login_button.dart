import 'package:flutter/material.dart';

class SignupLoginButton extends StatelessWidget {
  const SignupLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          print("Login");
        },
        child: const Text("Login"),
      ),
    );
  }
}
