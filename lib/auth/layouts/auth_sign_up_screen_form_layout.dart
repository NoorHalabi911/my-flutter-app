import 'package:flutter/material.dart';
import 'package:quiz/auth/widgets/auth_branded_gradient_scroll_shell.dart';
import 'package:quiz/auth/widgets/auth_email_text_field.dart';
import 'package:quiz/auth/widgets/auth_google_identity_button.dart';
import 'package:quiz/auth/widgets/auth_password_confirm_text_field.dart';
import 'package:quiz/auth/widgets/auth_password_text_field.dart';
import 'package:quiz/auth/widgets/auth_route_navigation_buttons.dart';
import 'package:quiz/theme/app_colors.dart';

/// Sign-up column inside [Form]: fields, submit, Google, back to login.
class AuthSignUpScreenFormLayout extends StatelessWidget {
  const AuthSignUpScreenFormLayout({
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
    return AuthBrandedGradientScrollShell(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_add_alt_1_outlined,
              size: 60,
              color: AppColors.iconTint,
            ),
            const SizedBox(height: 12),
            const Text(
              'Create Account',
              style: TextStyle(
                color: AppColors.headingTint,
                fontSize: 40,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            AuthEmailTextField(controller: emailController),
            const SizedBox(height: 20),
            AuthPasswordTextField(
              isPasswordObscured: isPasswordObscured,
              onToggleVisibility: onToggleVisibility,
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            AuthPasswordConfirmTextField(
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
                  backgroundColor: AppColors.brandBlue,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: onSubmit,
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const AuthGoogleIdentityButton(),
            const SizedBox(height: 16),
            const AuthNavigateToLoginButton(),
          ],
        ),
      ),
    );
  }
}
