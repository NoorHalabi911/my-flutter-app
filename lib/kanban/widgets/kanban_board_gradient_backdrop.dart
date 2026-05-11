import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

/// Full-screen gradient behind Kanban content (matches auth screens).
class KanbanBoardGradientBackdrop extends StatelessWidget {
  const KanbanBoardGradientBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradientTop, AppColors.gradientBottom],
        ),
      ),
      child: child,
    );
  }
}
