import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/kanban/layouts/kanban_board_screen_shell_layout.dart';
import 'package:quiz/kanban/state/kanban_board_tasks_list_controller.dart';

/// Full-screen Kanban after login. Requires [registerKanbanBoardTasksListController] first.
class KanbanBoardScreen extends StatelessWidget {
  const KanbanBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const KanbanBoardScreenShellLayout();
  }
}

/// Call before [KanbanBoardScreen] so each login gets a fresh task list controller.
void registerKanbanBoardTasksListController() {
  if (Get.isRegistered<KanbanBoardTasksListController>()) {
    Get.delete<KanbanBoardTasksListController>(force: true);
  }
  Get.put(KanbanBoardTasksListController());
}
