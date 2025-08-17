import '../../../../core/network/network_info.dart'; // <-- ✅ Import the NetworkInfo
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo; // ✅ Changed from bool isConnected

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo, 
    // required bool isConnected,
  });

  @override
  Future<List<Product>> getAllProducts() async {
    if (await networkInfo.isConnected) {
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
    if (await networkInfo.isConnected) {
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
    if (await networkInfo.isConnected) {
      await remoteDataSource.addProduct(model);
    } else {
      await localDataSource.cacheProduct(model);
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    final model = ProductModel.fromEntity(product);
    if (await networkInfo.isConnected) {
      await remoteDataSource.updateProduct(model);
    } else {
      await localDataSource.cacheProduct(model);
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      await remoteDataSource.deleteProduct(id);
    } else {
      await localDataSource.deleteCachedProduct(id);
    }
  }
}
