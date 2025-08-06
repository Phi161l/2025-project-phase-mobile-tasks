import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../../lib/features/product/data/datasources/product_remote_data_source_impl.dart';
import '../../../../../lib/features/product/data/models/product_model.dart';

// Mock class
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockHttpClient mockClient;

  setUp(() {
    mockClient = MockHttpClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockClient, baseUrl: 'HTTP/');
  });

  final baseUrl = 'https://65f85c2cdf151452460f6d1b.mockapi.io/api/v1/products';

  group('getAllProducts', () {
    test('returns list of products on success', () async {
      final responseJson = [
        {'id': '1', 'name': 'Test Product', 'description': 'desc', 'price': 10.0}
      ];

      when(mockClient.get(Uri.parse(baseUrl)))
          .thenAnswer((_) async => http.Response(jsonEncode(responseJson), 200));

      final result = await dataSource.getAllProducts();

      expect(result, isA<List<ProductModel>>());
      expect(result.first.name, 'Test Product');
    });
  });

  group('getProductById', () {
    test('returns product on success', () async {
      final id = '1';
      final productJson = {'id': id, 'name': 'Product', 'description': 'desc', 'price': 10.0};

      when(mockClient.get(Uri.parse('$baseUrl/$id')))
          .thenAnswer((_) async => http.Response(jsonEncode(productJson), 200));

      final result = await dataSource.getProductById(id);

      expect(result, isA<ProductModel>());
      expect(result.id, id);
    });
  });

  group('addProduct', () {
    test('calls POST with correct body', () async {
      final product = const ProductModel(id: '3', name: 'New', description: 'desc', price: 20.0, imageUrl: 'HFBFK');

      when(mockClient.post(Uri.parse(baseUrl),
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('', 201));

      await dataSource.addProduct(product);

      verify(mockClient.post(Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(product.toJson())));
    });
  });

  group('updateProduct', () {
    test('calls PUT with correct body', () async {
      final product = const ProductModel(id: '1', name: 'Updated', description: 'desc', price: 25.0, imageUrl: 'IUHB');

      when(mockClient.put(Uri.parse('$baseUrl/${product.id}'),
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('', 200));

      await dataSource.updateProduct(product);

      verify(mockClient.put(Uri.parse('$baseUrl/${product.id}'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(product.toJson())));
    });
  });

  group('deleteProduct', () {
    test('calls DELETE with correct ID', () async {
      final id = '1';

      when(mockClient.delete(Uri.parse('$baseUrl/$id')))
          .thenAnswer((_) async => http.Response('', 200));

      await dataSource.deleteProduct(id);

      verify(mockClient.delete(Uri.parse('$baseUrl/$id')));
    });
  });
}
