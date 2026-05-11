import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/kanban/state/kanban_board_tasks_list_controller.dart';
import 'package:quiz/kanban/widgets/kanban_board_root_task_card.dart';
import 'package:quiz/kanban/widgets/kanban_board_tasks_empty_hint_panel.dart';
import 'package:quiz/kanban/widgets/kanban_board_tasks_table_header_strip.dart';

/// Rebuilds when [KanbanBoardTasksListController.tasks] changes.
class KanbanBoardTasksObservableListPanel extends StatelessWidget {
  const KanbanBoardTasksObservableListPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = Get.find<KanbanBoardTasksListController>().tasks;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const KanbanBoardTasksTableHeaderStrip(),
          const SizedBox(height: 8),
          if (list.isEmpty)
            const KanbanBoardTasksEmptyHintPanel()
          else
            ...list.map((t) => KanbanBoardRootTaskCard(task: t)),
        ],
      );
    });
  }
}
