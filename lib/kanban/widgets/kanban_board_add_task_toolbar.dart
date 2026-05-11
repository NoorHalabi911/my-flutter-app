import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/kanban/state/kanban_board_tasks_list_controller.dart';
import 'package:quiz/theme/app_colors.dart';

/// Top-right control to open the “new task” dialog.
class KanbanBoardAddTaskToolbar extends StatelessWidget {
  const KanbanBoardAddTaskToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<KanbanBoardTasksListController>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brandBlue,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            onPressed: c.promptAddRootTask,
            icon: const Icon(Icons.add, size: 22),
            label: const Text(
              'ADD TASK',
              style: TextStyle(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
