import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final bool isUpdateMode;
  final VoidCallback onAddUpdate;
  final VoidCallback? onDelete;

  const ActionButtons({
    super.key,
    required this.isUpdateMode,
    required this.onAddUpdate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onAddUpdate,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3F51F1),
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            isUpdateMode ? 'UPDATE' : 'ADD',
            style: const TextStyle(color: Colors.white,  fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        if (isUpdateMode)
          OutlinedButton(
            onPressed: onDelete,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              foregroundColor: Colors.red,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'DELETE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
