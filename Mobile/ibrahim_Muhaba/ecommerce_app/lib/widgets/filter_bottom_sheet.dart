import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final TextEditingController categoryController;
  final RangeValues priceRange;
  final ValueChanged<RangeValues> onPriceChanged;
  final VoidCallback onApply;

  const FilterBottomSheet({
    super.key,
    required this.categoryController,
    required this.priceRange,
    required this.onPriceChanged,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Catagory', style: TextStyle(fontSize: 16)),
          ),
          TextField(
            controller: categoryController,
            decoration: InputDecoration(
              // labelText: 'Category',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            ),
          ),
          const SizedBox(height: 25),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Price', style: TextStyle(fontSize: 16)),
          ),
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 500,
            divisions: 10,
            activeColor: Colors.blue,
            labels: RangeLabels(
              '\$${priceRange.start.round()}',
              '\$${priceRange.end.round()}',
            ),
            onChanged: onPriceChanged,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onApply,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3F63F6),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('APPLY', style: TextStyle( color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
