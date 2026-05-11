/// One task row on the board; [children] are sub-tasks (tree).
class KanbanBoardTaskNode {
  KanbanBoardTaskNode({
    required this.id,
    required this.title,
    List<KanbanBoardTaskNode>? children,
  }) : children = children ?? <KanbanBoardTaskNode>[];

  final String id;
  String title;
  final List<KanbanBoardTaskNode> children;
}
