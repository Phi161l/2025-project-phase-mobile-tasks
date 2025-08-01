import 'package:flutter_test/flutter_test.dart';
import '../../../../../lib/features/product/data/models/product_model.dart';



void main() {
  const productModel = ProductModel(
    id: '1',
    name: 'Test Product',
    description: 'A test product description',
    price: 99.99,
    imageUrl: 'https://example.com/image.png',
  );

  final productJson = {
    'id': '1',
    'name': 'Test Product',
    'description': 'A test product description',
    'price': 99.99,
    'imageUrl': 'https://example.com/image.png',
  };

  test('should return a valid model from JSON', () {
    final result = ProductModel.fromJson(productJson);
    expect(result, productModel);
  });

  test('should return JSON from ProductModel', () {
    final result = productModel.toJson();
    expect(result, productJson);
  });
}
