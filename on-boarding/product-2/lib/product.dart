// lib/product.dart

class Product {
  String name;
  String description;
  double price;

  Product({
    required this.name,
    required this.description,
    required this.price,
  });

  void display() {
    print('Name: $name');
    print('Description: $description');
    print('Price: \$${price.toStringAsFixed(2)}');
  }
}
