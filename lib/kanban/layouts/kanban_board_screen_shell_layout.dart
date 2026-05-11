import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/kanban/state/kanban_board_tasks_list_controller.dart';
import 'package:quiz/kanban/widgets/kanban_board_add_task_toolbar.dart';
import 'package:quiz/kanban/widgets/kanban_board_gradient_backdrop.dart';
import 'package:quiz/kanban/widgets/kanban_board_tasks_scroll_view.dart';
import 'package:quiz/kanban/widgets/kanban_board_title_app_bar.dart';

/// Scaffold + gradient + toolbar + scrollable task list.
class KanbanBoardScreenShellLayout
    extends GetView<KanbanBoardTasksListController> {
  const KanbanBoardScreenShellLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KanbanBoardTitleAppBar(),
      body: KanbanBoardGradientBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                KanbanBoardAddTaskToolbar(),
                Expanded(child: KanbanBoardTasksScrollView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
