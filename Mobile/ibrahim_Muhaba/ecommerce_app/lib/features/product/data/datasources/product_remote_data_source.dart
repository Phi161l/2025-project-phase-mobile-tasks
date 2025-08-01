import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  /// Fetches all products from the remote server
  Future<List<ProductModel>> getAllProducts();

  /// Fetches a single product by its ID from the remote server
  Future<ProductModel> getProductById(String id);

  /// Adds a new product to the remote server
  Future<void> addProduct(ProductModel product);

  /// Updates an existing product on the remote server
  Future<void> updateProduct(ProductModel product);

  /// Deletes a product by ID on the remote server
  Future<void> deleteProduct(String id);
}
