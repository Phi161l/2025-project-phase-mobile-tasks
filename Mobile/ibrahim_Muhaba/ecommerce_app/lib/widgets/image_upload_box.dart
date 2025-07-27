import 'package:flutter/material.dart';

class ImageUploadBox extends StatelessWidget {
  const ImageUploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 40, color: Colors.black54),
            SizedBox(height: 8),
            Text('upload image', style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
