import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final bool isConnected;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.isConnected,
  });

  @override
  Future<List<Product>> getAllProducts() async {
    if (isConnected) {
      final remoteModels = await remoteDataSource.getAllProducts();
      await localDataSource.cacheProducts(remoteModels);
      return remoteModels.map((model) => model.toEntity()).toList();
    } else {
      final localModels = await localDataSource.getCachedProducts();
      return localModels.map((model) => model.toEntity()).toList();
    }
  }

  @override
  Future<Product?> getProductById(String id) async {
    if (isConnected) {
      final model = await remoteDataSource.getProductById(id);
      return model.toEntity();
    } else {
      final model = await localDataSource.getCachedProductById(id);
      return model.toEntity();
    }
  }

  @override
  Future<void> createProduct(Product product) async {
    final model = ProductModel.fromEntity(product);
    if (isConnected) {
      await remoteDataSource.addProduct(model);
    } else {
      await localDataSource.cacheProduct(model);
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    final model = ProductModel.fromEntity(product);
    if (isConnected) {
      await remoteDataSource.updateProduct(model);
    } else {
      await localDataSource.cacheProduct(model);
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    if (isConnected) {
      await remoteDataSource.deleteProduct(id);
    } else {
      await localDataSource.deleteCachedProduct(id);
    }
  }
}
