import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/add_update_screen.dart.dart';     // Fix typo `.dart.dart`

class BottomButtons extends StatelessWidget {
  final Product product;

  const BottomButtons({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // DELETE BUTTON
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // TODO: Handle delete logic
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("DELETE", style: TextStyle(color: Colors.red)),
            ),
          ),

          const SizedBox(width: 16),

          // UPDATE BUTTON
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AddUpdateScreen(product: product), // Product passed
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("UPDATE", style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}
