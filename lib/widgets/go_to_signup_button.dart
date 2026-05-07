import 'package:flutter/material.dart';
import 'package:quiz/sign-up.dart';

class GoToSignUpButton extends StatelessWidget {
  const GoToSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ),
        );
      },
      child: const Text('Not registered? Sign Up'),
    );
  }
}
