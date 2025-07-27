import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 28, backgroundColor: Colors.grey, backgroundImage: AssetImage('assets/profile.jpg'),),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('July 14, 2023', style: TextStyle(color: Colors.grey)),
            Text.rich(
              TextSpan(
                text: 'Hello, ',
                children: [
                  TextSpan(
                    text: 'Yohannes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications_none, size: 30, color: Colors.grey,),
      ],
    );
  }
}
