import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<int> sizes;
  final int selectedSize; // the actual size of the shoe

  const SizeSelector({
    super.key,
    this.sizes = const [38, 39, 40, 41, 42],
    required this.selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: sizes.map((size) {
        final isSelected = size == selectedSize;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$size',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}
