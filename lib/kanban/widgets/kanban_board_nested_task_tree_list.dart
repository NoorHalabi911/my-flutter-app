import 'package:flutter/material.dart';
import 'package:quiz/kanban/models/kanban_board_task_node.dart';
import 'package:quiz/kanban/widgets/kanban_board_child_task_row.dart';

/// Renders [nodes] and their descendants with indentation.
class KanbanBoardNestedTaskTreeList extends StatelessWidget {
  const KanbanBoardNestedTaskTreeList({
    super.key,
    required this.nodes,
    this.depth = 0,
  });

  final List<KanbanBoardTaskNode> nodes;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (final child in nodes) {
      children.add(KanbanBoardChildTaskRow(task: child, depth: depth));
      if (child.children.isNotEmpty) {
        children.add(
          KanbanBoardNestedTaskTreeList(
            nodes: child.children,
            depth: depth + 1,
          ),
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
