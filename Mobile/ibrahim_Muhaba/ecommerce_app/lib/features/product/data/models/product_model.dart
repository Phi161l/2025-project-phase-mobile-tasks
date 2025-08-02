// import the base Product entity
import '../../domain/entities/product.dart';

/// ProductModel is a data model that extends the Product entity. It can be used for converting between JSON and domain entity.
class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
  });


  /// Create a ProductModel from a JSON map (usually from API or local storage)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
    );
  }

  /// Convert this ProductModel into a JSON map (for storage or sending to API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  /// Create a ProductModel from a domain-level Product entity   This is used when saving data (e.g. to local/remote source)
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
  }  
  
  /// 🔁 Convert ProductModel back to Product entity
  Product toEntity() {                      // but No need to add toEntity() because ProductModel is already a Product.
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
}
