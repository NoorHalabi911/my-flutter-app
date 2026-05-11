import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz/auth/layouts/auth_sign_up_screen_form_layout.dart';

/// Google client init + sign-up form state.
class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmObscured = true;

  @override
  void initState() {
    super.initState();
    _googleSignIn.initialize(
      clientId:
          '963128156550-rs1ekl5r76m68rblkkhtrffdpp5m0gsm.apps.googleusercontent.com',
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Sign-up validated (demo — connect your backend when ready).',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthSignUpScreenFormLayout(
        isPasswordObscured: _isPasswordObscured,
        onToggleVisibility: () {
          setState(() => _isPasswordObscured = !_isPasswordObscured);
        },
        isConfirmObscured: _isConfirmObscured,
        onToggleConfirmVisibility: () {
          setState(() => _isConfirmObscured = !_isConfirmObscured);
        },
        formKey: _formKey,
        emailController: _emailController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
        onSubmit: _onSubmit,
      ),
    );
  }
}
