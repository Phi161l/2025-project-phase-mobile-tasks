import 'package:flutter/material.dart';
import '../models/product_model.dart';
// import 'update_screen.dart';
import '../widgets/details_image.dart';
import '../widgets/product_info_row.dart';
import '../widgets/size_selector.dart';
import '../widgets/bottom_buttons.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DetailsImage(image: product.image),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductInfoRow(product: product),
                      const SizedBox(height: 24),
                      const Text("Size:", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      SizeSelector(selectedSize: 40), // Replace 40 with actual shoe size i.e: requires updating the data.   here we have passed in hard code.
                      const SizedBox(height: 24),
                      Text(
                        product.detail,
                        style: const TextStyle(
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButtons(product: product),
          ],
        ),
      ),
    );
  }
}
