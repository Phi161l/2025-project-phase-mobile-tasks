import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../lib/features/product/data/datasources/product_local_data_source_impl.dart';
import '../../../../../lib/features/product/data/models/product_model.dart';

void main() {
  late SharedPreferences sharedPreferences;
  late ProductLocalDataSourceImpl dataSource;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    dataSource =
        ProductLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });

  final testProduct = const ProductModel(
    id: '1',
    name: 'Test Product',
    price: 9.99,
    description: 'A test product',
    imageUrl: 'https://example.com/image.png',
  );

  final testProductList = [testProduct];

  group('ProductLocalDataSourceImpl Tests', () {
    test('should cache a product and retrieve it by ID', () async {
      await dataSource.cacheProduct(testProduct);
      final result = await dataSource.getCachedProductById('1');
      expect(result.id, testProduct.id);
      expect(result.name, testProduct.name);
    });

    test('should cache and retrieve list of products', () async {
      await dataSource.cacheProducts(testProductList);
      final result = await dataSource.getCachedProducts();
      expect(result.length, 1);
      expect(result.first.id, testProduct.id);
    });

    test('should delete a cached product by ID', () async {
      await dataSource.cacheProduct(testProduct);
      await dataSource.deleteCachedProduct('1');

      expect(
        () async => await dataSource.getCachedProductById('1'),
        throwsException,
      );
    });
  });
}
