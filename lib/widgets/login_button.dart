import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: ElevatedButton(
        onPressed: () {
          print("Login");
        },
        child: const Text("Login"),
      ),
    );
  }
}
