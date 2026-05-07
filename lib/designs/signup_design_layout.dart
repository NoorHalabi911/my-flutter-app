import 'package:flutter/material.dart';
import 'package:quiz/widgets/signup_widgets.dart';

class SignupDesignLayout extends StatelessWidget {
  const SignupDesignLayout({
    super.key,
    required this.isPasswordObscured,
    required this.onToggleVisibility,
    required this.isConfirmObscured,
    required this.onToggleConfirmVisibility,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSubmit,
  });

  final bool isPasswordObscured;
  final VoidCallback onToggleVisibility;
  final bool isConfirmObscured;
  final VoidCallback onToggleConfirmVisibility;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC493DF),
            Color(0xFF9EDCDF),
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_add_alt_1_outlined,
                    size: 60,
                    color: Color(0xFFEFF5FF),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color(0xFFF0F6FF),
                      fontSize: 40,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SignupEmailField(controller: emailController),
                  const SizedBox(height: 20),
                  SignupPasswordField(
                    isPasswordObscured: isPasswordObscured,
                    onToggleVisibility: onToggleVisibility,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  SignupConfirmPasswordField(
                    isObscured: isConfirmObscured,
                    onToggleVisibility: onToggleConfirmVisibility,
                    controller: confirmPasswordController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: 310,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E5D95),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: onSubmit,
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SignupGoogleButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
