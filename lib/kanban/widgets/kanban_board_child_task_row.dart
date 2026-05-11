import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:quiz/kanban/models/kanban_board_task_node.dart';
import 'package:quiz/kanban/widgets/kanban_board_task_overflow_actions_menu.dart';
import 'package:quiz/theme/app_colors.dart';

/// One nested task line (indented chip + overflow menu).
class KanbanBoardChildTaskRow extends StatelessWidget {
  const KanbanBoardChildTaskRow({
    super.key,
    required this.task,
    required this.depth,
  });

  final KanbanBoardTaskNode task;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final indent = math.min(16.0 + depth * 14.0, 96.0);

    return Padding(
      padding: EdgeInsets.only(left: indent, top: 6, bottom: 2),
      child: Material(
        color: AppColors.softSurface,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.subdirectory_arrow_right,
                size: 18,
                color: Colors.blueGrey.shade400,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  task.title,
                  style: const TextStyle(
                    color: AppColors.mutedSlate,
                    fontSize: 14,
                    height: 1.25,
                  ),
                ),
              ),
              KanbanBoardTaskOverflowActionsMenu(
                task: task,
                compactLabels: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
