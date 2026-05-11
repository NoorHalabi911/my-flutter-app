import 'dart:math';

/// Creates unique ids for new [KanbanBoardTaskNode]s.
String generateKanbanBoardTaskNodeId() =>
    '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(1 << 20)}';
