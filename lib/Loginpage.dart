import 'package:flutter/material.dart';
import 'package:quiz/designs/login_design_layout.dart';

class LogeinScreen extends StatefulWidget {
  const LogeinScreen({super.key});

  @override
  State<LogeinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogeinScreen> {
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 
  bool isPasswordObscured = true;
   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginDesignLayout(
        isPasswordObscured: isPasswordObscured,
        onToggleVisibility: () {
          setState(() {
            isPasswordObscured = !isPasswordObscured;
          });
        },
        passwordController: _passwordController,
        emailController: _emailController,
      ),
    );
  }
}
