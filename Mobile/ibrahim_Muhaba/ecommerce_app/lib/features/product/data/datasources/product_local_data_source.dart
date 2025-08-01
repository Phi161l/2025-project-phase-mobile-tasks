import '../models/product_model.dart';


abstract class ProductLocalDataSource {
  /// Caches a list of products locally
  Future<void> cacheProducts(List<ProductModel> products);

  /// Gets the cached list of products
  Future<List<ProductModel>> getCachedProducts();

  /// Caches a single product by ID
  Future<void> cacheProduct(ProductModel product);

  /// Gets a single cached product by ID
  Future<ProductModel> getCachedProductById(String id);

  /// Deletes a product from the local cache
  Future<void> deleteCachedProduct(String id);
}
