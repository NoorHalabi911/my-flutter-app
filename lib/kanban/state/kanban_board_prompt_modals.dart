import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/kanban/widgets/kanban_board_task_title_input_dialog.dart';
import 'package:quiz/theme/app_colors.dart';

/// GetX dialogs for creating / editing / deleting tasks.
abstract final class KanbanBoardPromptModals {
  static Future<String?> promptTaskTitle({
    required String title,
    required String hint,
    String? initial,
  }) async {
    final result = await Get.dialog<String?>(
      KanbanBoardTaskTitleInputDialog(
        title: title,
        hint: hint,
        initial: initial,
      ),
      barrierDismissible: false,
    );
    if (result == null || result.isEmpty) return null;
    return result;
  }

  static Future<bool> confirmDeleteTaskAndSubtree(String label) async {
    final ok = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Delete task'),
        content: Text('Delete "$label" and all of its sub-tasks?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Get.back(result: true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    return ok == true;
  }
}
