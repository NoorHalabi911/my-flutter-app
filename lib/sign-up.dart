import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz/designs/signup_design_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isPasswordObscured = true;
  bool isConfirmObscured = true;

  @override
  void initState() {
    super.initState();

    googleSignIn.initialize(
      clientId:
          "963128156550-rs1ekl5r76m68rblkkhtrffdpp5m0gsm.apps.googleusercontent.com",
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupDesignLayout(
        isPasswordObscured: isPasswordObscured,
        onToggleVisibility: () {
          setState(() {
            isPasswordObscured = !isPasswordObscured;
          });
        },
        isConfirmObscured: isConfirmObscured,
        onToggleConfirmVisibility: () {
          setState(() {
            isConfirmObscured = !isConfirmObscured;
          });
        },
        formKey: _formKey,
        emailController: _emailController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
        onSubmit: () {
          if (_formKey.currentState?.validate() ?? false) {
            print("Login");
          }
        },
      ),
    );
  }
}
