import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/auth/widgets/auth_branded_gradient_scroll_shell.dart';
import 'package:quiz/auth/widgets/auth_email_text_field.dart';
import 'package:quiz/auth/widgets/auth_password_text_field.dart';
import 'package:quiz/auth/widgets/auth_route_navigation_buttons.dart';
import 'package:quiz/kanban/screens/kanban_board_screen.dart';
import 'package:quiz/theme/app_colors.dart';

/// Login column: fields, login CTA, link to sign-up.
class AuthLoginScreenFormLayout extends StatelessWidget {
  const AuthLoginScreenFormLayout({
    super.key,
    required this.isPasswordObscured,
    required this.onToggleVisibility,
    required this.passwordController,
    required this.emailController,
  });

  final bool isPasswordObscured;
  final VoidCallback onToggleVisibility;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return AuthBrandedGradientScrollShell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_outline, size: 62, color: AppColors.iconTint),
          const SizedBox(height: 12),
          const Text(
            'User Login',
            style: TextStyle(
              color: AppColors.headingTint,
              fontSize: 46,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 36),
          AuthEmailTextField(controller: emailController),
          const SizedBox(height: 22),
          AuthPasswordTextField(
            isPasswordObscured: isPasswordObscured,
            onToggleVisibility: onToggleVisibility,
            controller: passwordController,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 340,
            child: Row(
              children: const [
                Icon(
                  Icons.check_box,
                  size: 18,
                  color: AppColors.checkboxAccent,
                ),
                SizedBox(width: 8),
                Text(
                  'Remember me',
                  style: TextStyle(color: AppColors.mutedSlate, fontSize: 14),
                ),
                Spacer(),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.mutedSlate,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
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
              onPressed: () {
                registerKanbanBoardTasksListController();
                Get.off(() => const KanbanBoardScreen());
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const AuthNavigateToSignUpButton(),
        ],
      ),
    );
  }
}
