import 'package:flutter/material.dart';
import 'package:quiz/Loginpage.dart';
import 'package:quiz/sign-up.dart';

class AuthSwitchButton extends StatelessWidget {
  const AuthSwitchButton({
    super.key,
    required this.label,
    required this.targetBuilder,
  });

  final String label;
  final WidgetBuilder targetBuilder;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: targetBuilder),
        );
      },
      child: Text(label),
    );
  }
}

class GoToSignUpButton extends StatelessWidget {
  const GoToSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSwitchButton(
      label: 'Not registered? Sign Up',
      targetBuilder: _buildSignup,
    );
  }

  static Widget _buildSignup(BuildContext context) => const SignupScreen();
}

class GoToLoginButton extends StatelessWidget {
  const GoToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSwitchButton(
      label: 'Already registered? Login',
      targetBuilder: _buildLogin,
    );
  }

  static Widget _buildLogin(BuildContext context) => const LogeinScreen();
}
