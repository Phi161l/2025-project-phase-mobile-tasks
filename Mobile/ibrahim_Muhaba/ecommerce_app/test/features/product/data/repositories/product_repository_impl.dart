import 'package:flutter_test/flutter_test.dart';

import '../../../../../lib/features/product/data/datasources/product_local_data_source.dart';
import '../../../../../lib/features/product/data/datasources/product_remote_data_source.dart';
import '../../../../../lib/features/product/data/models/product_model.dart';
import '../../../../../lib/features/product/data/repositories/product_repository_impl.dart';

class FakeRemoteDataSource implements ProductRemoteDataSource {
  final List<ProductModel> _products = [
    const ProductModel(
      id: '1',
      name: 'Remote Product',
      description: 'Remote Desc',
      price: 99.99,
      imageUrl: 'http://remote.com/img1',
    ),
  ];

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return _products;
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    return _products.firstWhere((p) => p.id == id);
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    _products.add(product);
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    _products.removeWhere((p) => p.id == id);
  }
}

class FakeLocalDataSource implements ProductLocalDataSource {
  final List<ProductModel> _cache = [
    const ProductModel(
      id: '2',
      name: 'Local Product',
      description: 'Local Desc',
      price: 50.0,
      imageUrl: 'http://local.com/img2',
    ),
  ];

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    _cache.clear();
    _cache.addAll(products);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return _cache;
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    _cache.add(product);
  }

  @override
  Future<ProductModel> getCachedProductById(String id) async {
    return _cache.firstWhere((p) => p.id == id);
  }

  @override
  Future<void> deleteCachedProduct(String id) async {
    _cache.removeWhere((p) => p.id == id);
  }
}

void main() {
  late ProductRepositoryImpl repository;

  group('ProductRepositoryImpl', () {
    test('getAllProducts: fetches from remote if connected', () async {
      repository = ProductRepositoryImpl(
        remoteDataSource: FakeRemoteDataSource(),
        localDataSource: FakeLocalDataSource(),
        isConnected: true,
      );

      final result = await repository.getAllProducts();

      expect(result.length, 1);
      expect(result[0].name, 'Remote Product');
    });

    test('getAllProducts: fetches from local if offline', () async {
      repository = ProductRepositoryImpl(
        remoteDataSource: FakeRemoteDataSource(),
        localDataSource: FakeLocalDataSource(),
        isConnected: false,
      );

      final result = await repository.getAllProducts();

      expect(result.length, 1);
      expect(result[0].name, 'Local Product');
    });

    test('getProductById: returns correct product if connected', () async {
      repository = ProductRepositoryImpl(
        remoteDataSource: FakeRemoteDataSource(),
        localDataSource: FakeLocalDataSource(),
        isConnected: true,
      );

      final result = await repository.getProductById('1');

      expect(result?.name, 'Remote Product');
    });

    test('getProductById: returns correct product if offline', () async {
      repository = ProductRepositoryImpl(
        remoteDataSource: FakeRemoteDataSource(),
        localDataSource: FakeLocalDataSource(),
        isConnected: false,
      );

      final result = await repository.getProductById('2');

      expect(result?.name, 'Local Product');
    });

    test('createProduct: adds new product to remote if connected', () async {
      final remote = FakeRemoteDataSource();
      repository = ProductRepositoryImpl(
        remoteDataSource: remote,
        localDataSource: FakeLocalDataSource(),
        isConnected: true,
      );

      final newProduct = const ProductModel(
        id: '3',
        name: 'New Product',
        description: 'New Desc',
        price: 123.0,
        imageUrl: 'http://remote.com/new',
      );

      await repository.createProduct(newProduct);
      final result = await remote.getAllProducts();

      expect(result.any((p) => p.id == '3'), isTrue);
    });

    test('updateProduct: updates product in remote if connected', () async {
      final remote = FakeRemoteDataSource();
      repository = ProductRepositoryImpl(
        remoteDataSource: remote,
        localDataSource: FakeLocalDataSource(),
        isConnected: true,
      );

      final updatedProduct = const ProductModel(
        id: '1',
        name: 'Updated Name',
        description: 'Updated Desc',
        price: 199.0,
        imageUrl: 'http://updated.com/img',
      );

      await repository.updateProduct(updatedProduct);
      final result = await remote.getProductById('1');

      expect(result.name, 'Updated Name');
      expect(result.price, 199.0);
    });

    test('deleteProduct: deletes product from remote if connected', () async {
      final remote = FakeRemoteDataSource();
      repository = ProductRepositoryImpl(
        remoteDataSource: remote,
        localDataSource: FakeLocalDataSource(),
        isConnected: true,
      );

      await repository.deleteProduct('1');
      final result = await remote.getAllProducts();

      expect(result.any((p) => p.id == '1'), isFalse);
    });
  });
}
