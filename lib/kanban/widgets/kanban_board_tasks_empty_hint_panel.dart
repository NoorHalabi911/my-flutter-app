import 'package:flutter/material.dart';

/// Shown when there are zero root tasks.
class KanbanBoardTasksEmptyHintPanel extends StatelessWidget {
  const KanbanBoardTasksEmptyHintPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Text(
          'No tasks yet.\nTap "Add task" to create your first row.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.95),
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
