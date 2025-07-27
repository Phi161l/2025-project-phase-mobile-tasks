import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  final String image;

  const DetailsImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: Image.asset(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
