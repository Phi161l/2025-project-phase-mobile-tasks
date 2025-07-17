// lib/product_manager.dart

import 'product.dart';

class ProductManager {
  final List<Product> _products = [];

  void addProduct(String name, String description, double price) {
    var product = Product(
      name: name,
      description: description,
      price: price,
    );
    _products.add(product);
    print('✅ Product added.\n');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products found.\n');
      return;
    }

    for (var i = 0; i < _products.length; i++) {
      print('Product #${i + 1}');
      _products[i].display();
      print('---------------------');
    }
  }

  void viewProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('⚠️ Invalid product number.\n');
      return;
    }

    _products[index].display();
  }

  void editProduct(int index, String name, String description, double price) {
    if (index < 0 || index >= _products.length) {
      print('⚠️ Invalid product number.\n');
      return;
    }

    _products[index].name = name;
    _products[index].description = description;
    _products[index].price = price;

    print('✅ Product updated.\n');
  }

  void deleteProduct(int index) {
    if (index < 0 || index >= _products.length) {
      print('⚠️ Invalid product number.\n');
      return;
    }

    _products.removeAt(index);
    print('✅ Product deleted.\n');
  }
}
