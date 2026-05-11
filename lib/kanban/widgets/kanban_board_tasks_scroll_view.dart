import 'package:flutter/material.dart';
import 'package:quiz/kanban/widgets/kanban_board_tasks_observable_list_panel.dart';

/// Scrolls the task list area (no always-visible scrollbar — better on web).
class KanbanBoardTasksScrollView extends StatelessWidget {
  const KanbanBoardTasksScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 24),
      child: KanbanBoardTasksObservableListPanel(),
    );
  }
}
