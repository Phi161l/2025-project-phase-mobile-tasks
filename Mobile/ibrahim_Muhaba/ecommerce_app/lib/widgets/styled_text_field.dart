import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget? suffix;
  final int maxLines;

  const StyledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.suffix,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: suffix,
          labelStyle: const TextStyle(color: Colors.black87),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
