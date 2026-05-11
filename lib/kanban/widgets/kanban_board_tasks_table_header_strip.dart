import 'package:flutter/material.dart';
import 'package:quiz/theme/app_colors.dart';

/// Column titles above the task cards.
class KanbanBoardTasksTableHeaderStrip extends StatelessWidget {
  const KanbanBoardTasksTableHeaderStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.brandBlue.withValues(alpha: 0.25)),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2.2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: const [
          TableRow(
            children: [
              KanbanBoardTasksColumnHeaderLabel('Task'),
              KanbanBoardTasksColumnHeaderLabel('Sub-tasks', center: true),
              KanbanBoardTasksColumnHeaderLabel('Actions', center: true),
            ],
          ),
        ],
      ),
    );
  }
}

class KanbanBoardTasksColumnHeaderLabel extends StatelessWidget {
  const KanbanBoardTasksColumnHeaderLabel(
    this.label, {
    super.key,
    this.center = false,
  });

  final String label;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        label,
        textAlign: center ? TextAlign.center : TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColors.brandBlue,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
