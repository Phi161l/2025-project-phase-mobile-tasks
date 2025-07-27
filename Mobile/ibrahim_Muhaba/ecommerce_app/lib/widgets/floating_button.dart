import 'package:flutter/material.dart';
// import '../screens/add_update_screen.dart.dart';      // Make sure the path is correct

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigate to AddUpdateScreen without a product (this means "Add")
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => const AddUpdateScreen(), // No product passed
        //   ),
        // );
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, size: 32, ),
    );
  }
}