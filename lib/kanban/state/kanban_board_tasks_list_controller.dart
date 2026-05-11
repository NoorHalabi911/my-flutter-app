import 'package:get/get.dart';
import 'package:quiz/kanban/models/kanban_board_task_node.dart';
import 'package:quiz/kanban/state/kanban_board_prompt_modals.dart';
import 'package:quiz/kanban/state/kanban_board_task_forest_helpers.dart';
import 'package:quiz/kanban/state/kanban_board_task_id_generator.dart';

/// Observable list of root tasks + user actions (dialogs, mutations).
class KanbanBoardTasksListController extends GetxController {
  final tasks = <KanbanBoardTaskNode>[].obs;

  void addRootTask(String title) {
    tasks.add(
      KanbanBoardTaskNode(
        id: generateKanbanBoardTaskNodeId(),
        title: title.trim(),
      ),
    );
    tasks.refresh();
  }

  void addChildTask(String parentId, String title) {
    final parent = findKanbanBoardTaskNodeById(tasks, parentId);
    if (parent == null) return;
    parent.children.add(
      KanbanBoardTaskNode(
        id: generateKanbanBoardTaskNodeId(),
        title: title.trim(),
      ),
    );
    tasks.refresh();
  }

  void updateTaskTitle(String id, String newTitle) {
    final task = findKanbanBoardTaskNodeById(tasks, id);
    if (task == null) return;
    task.title = newTitle.trim();
    tasks.refresh();
  }

  void deleteTask(String id) {
    if (removeKanbanBoardTaskNodeById(tasks, id)) {
      tasks.refresh();
    }
  }

  Future<void> promptAddRootTask() async {
    final title = await KanbanBoardPromptModals.promptTaskTitle(
      title: 'New task',
      hint: 'Task name',
    );
    if (title == null || title.isEmpty) return;
    addRootTask(title);
  }

  Future<void> promptAddChildTask(String parentId) async {
    final title = await KanbanBoardPromptModals.promptTaskTitle(
      title: 'New sub-task',
      hint: 'Sub-task name',
    );
    if (title == null || title.isEmpty) return;
    addChildTask(parentId, title);
  }

  Future<void> promptEditTask(String id, String currentTitle) async {
    final title = await KanbanBoardPromptModals.promptTaskTitle(
      title: 'Edit task',
      hint: 'Task name',
      initial: currentTitle,
    );
    if (title == null || title.isEmpty) return;
    updateTaskTitle(id, title);
  }

  Future<void> confirmDeleteTask(String id, String label) async {
    final confirmed = await KanbanBoardPromptModals.confirmDeleteTaskAndSubtree(
      label,
    );
    if (confirmed) deleteTask(id);
  }
}
