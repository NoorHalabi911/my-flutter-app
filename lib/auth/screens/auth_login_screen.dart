import 'package:flutter/material.dart';
import 'package:quiz/auth/layouts/auth_login_screen_form_layout.dart';

/// Holds login text controllers and password visibility state.
class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthLoginScreenFormLayout(
        isPasswordObscured: _isPasswordObscured,
        onToggleVisibility: () {
          setState(() => _isPasswordObscured = !_isPasswordObscured);
        },
        passwordController: _passwordController,
        emailController: _emailController,
      ),
    );
  }
}
