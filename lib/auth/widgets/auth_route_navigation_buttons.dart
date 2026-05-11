import 'package:flutter/material.dart';
import 'package:quiz/auth/screens/auth_login_screen.dart';
import 'package:quiz/auth/screens/auth_sign_up_screen.dart';

/// Text button that pushes another auth screen on the stack.
class AuthRouteNavigationTextButton extends StatelessWidget {
  const AuthRouteNavigationTextButton({
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
        Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: targetBuilder));
      },
      child: Text(label),
    );
  }
}

/// From login → sign-up screen.
class AuthNavigateToSignUpButton extends StatelessWidget {
  const AuthNavigateToSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthRouteNavigationTextButton(
      label: 'Not registered? Sign Up',
      targetBuilder: _buildSignUp,
    );
  }

  static Widget _buildSignUp(BuildContext context) => const AuthSignUpScreen();
}

/// From sign-up → login screen.
class AuthNavigateToLoginButton extends StatelessWidget {
  const AuthNavigateToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthRouteNavigationTextButton(
      label: 'Already registered? Login',
      targetBuilder: _buildLogin,
    );
  }

  static Widget _buildLogin(BuildContext context) => const AuthLoginScreen();
}
