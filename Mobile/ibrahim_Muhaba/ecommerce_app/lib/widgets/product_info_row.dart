import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductInfoRow extends StatelessWidget {
  final Product product;

  const ProductInfoRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.subtitle,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 4),
              Text(product.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text("(${product.rating})",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            Text("\$${product.price.toStringAsFixed(0)}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
