import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(Uri.parse(ApiConstants.products));

    if (response.statusCode == 200) {
      final List decoded = json.decode(response.body);
      return decoded.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerException('Failed to load products');
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(Uri.parse(ApiConstants.productById(id)));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException('Failed to load product with id: $id');
    }
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    final response = await client.post(
      Uri.parse(ApiConstants.products),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw ServerException('Failed to add product');
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    final response = await client.put(
      Uri.parse(ApiConstants.productById(product.id)),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw ServerException('Failed to update product');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse(ApiConstants.productById(id)));

    if (response.statusCode != 200) {
      throw ServerException('Failed to delete product');
    }
  }
}
