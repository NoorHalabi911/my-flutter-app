import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/kanban/models/kanban_board_task_node.dart';
import 'package:quiz/kanban/state/kanban_board_tasks_list_controller.dart';
import 'package:quiz/theme/app_colors.dart';

/// ⋮ menu wired to [KanbanBoardTasksListController] actions.
class KanbanBoardTaskOverflowActionsMenu extends StatelessWidget {
  const KanbanBoardTaskOverflowActionsMenu({
    super.key,
    required this.task,
    this.compactLabels = false,
  });

  final KanbanBoardTaskNode task;
  final bool compactLabels;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<KanbanBoardTasksListController>();

    return PopupMenuButton<String>(
      tooltip: compactLabels ? 'Sub-task actions' : 'Task actions',
      padding: compactLabels
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 4),
      icon: Icon(
        Icons.more_vert,
        size: compactLabels ? 22 : 24,
        color: AppColors.brandBlue,
      ),
      onSelected: (value) {
        switch (value) {
          case 'add':
            c.promptAddChildTask(task.id);
          case 'edit':
            c.promptEditTask(task.id, task.title);
          case 'delete':
            c.confirmDeleteTask(task.id, task.title);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'add',
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              compactLabels ? Icons.add_circle_outline : Icons.add_task,
              size: compactLabels ? 20 : 22,
            ),
            title: Text(compactLabels ? 'Add nested' : 'Add sub-task'),
          ),
        ),
        PopupMenuItem(
          value: 'edit',
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.edit_outlined, size: compactLabels ? 20 : 22),
            title: const Text('Edit'),
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.delete_outline,
              size: compactLabels ? 20 : 22,
              color: AppColors.danger,
            ),
            title: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
