import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/theme/app_colors.dart';

/// Modal text field; owns [TextEditingController] for safe dispose on pop.
class KanbanBoardTaskTitleInputDialog extends StatefulWidget {
  const KanbanBoardTaskTitleInputDialog({
    super.key,
    required this.title,
    required this.hint,
    this.initial,
  });

  final String title;
  final String hint;
  final String? initial;

  @override
  State<KanbanBoardTaskTitleInputDialog> createState() =>
      _KanbanBoardTaskTitleInputDialogState();
}

class _KanbanBoardTaskTitleInputDialogState
    extends State<KanbanBoardTaskTitleInputDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initial);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final t = _controller.text.trim();
    Get.back<String?>(result: t.isEmpty ? null : t);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(hintText: widget.hint),
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back<String?>(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _submit,
          style: FilledButton.styleFrom(backgroundColor: AppColors.brandBlue),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
