import 'package:quiz/kanban/models/kanban_board_task_node.dart';

/// Pure tree search / delete (no GetX, no UI).

KanbanBoardTaskNode? findKanbanBoardTaskNodeById(
  List<KanbanBoardTaskNode> roots,
  String id,
) {
  for (final t in roots) {
    if (t.id == id) return t;
    final nested = findKanbanBoardTaskNodeById(t.children, id);
    if (nested != null) return nested;
  }
  return null;
}

bool removeKanbanBoardTaskNodeById(List<KanbanBoardTaskNode> roots, String id) {
  for (var i = 0; i < roots.length; i++) {
    if (roots[i].id == id) {
      roots.removeAt(i);
      return true;
    }
    if (removeKanbanBoardTaskNodeById(roots[i].children, id)) {
      return true;
    }
  }
  return false;
}
