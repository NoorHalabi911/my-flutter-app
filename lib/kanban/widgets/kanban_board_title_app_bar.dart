import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

class KanbanBoardTitleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const KanbanBoardTitleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Kanban',
        style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.5),
      ),
      backgroundColor: AppColors.brandBlue,
      foregroundColor: Colors.white,
      elevation: 2,
    );
  }
}
