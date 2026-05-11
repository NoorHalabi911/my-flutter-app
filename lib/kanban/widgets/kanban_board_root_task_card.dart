import 'package:flutter/material.dart';
import 'package:quiz/kanban/models/kanban_board_task_node.dart';
import 'package:quiz/kanban/widgets/kanban_board_nested_task_tree_list.dart';
import 'package:quiz/kanban/widgets/kanban_board_task_overflow_actions_menu.dart';
import 'package:quiz/theme/app_colors.dart';

/// Card for a root-level task and its nested subtree.
class KanbanBoardRootTaskCard extends StatelessWidget {
  const KanbanBoardRootTaskCard({super.key, required this.task});

  final KanbanBoardTaskNode task;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      color: Colors.white.withValues(alpha: 0.94),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.brandBlue,
                    ),
                  ),
                ),
                KanbanBoardTaskOverflowActionsMenu(task: task),
              ],
            ),
            if (task.children.isNotEmpty) ...[
              const Divider(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sub-tasks',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedSlate,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              KanbanBoardNestedTaskTreeList(nodes: task.children, depth: 0),
            ],
          ],
        ),
      ),
    );
  }
}
