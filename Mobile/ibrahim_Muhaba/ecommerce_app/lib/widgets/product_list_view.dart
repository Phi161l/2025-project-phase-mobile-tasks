import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_card.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
