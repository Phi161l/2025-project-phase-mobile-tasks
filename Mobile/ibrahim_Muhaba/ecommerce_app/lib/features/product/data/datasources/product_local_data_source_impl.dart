import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';
import 'product_local_data_source.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _cachedProductsKey = 'CACHED_PRODUCTS';

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final productListJson = jsonEncode(products.map((p) => p.toJson()).toList());
    await sharedPreferences.setString(_cachedProductsKey, productListJson);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final jsonString = sharedPreferences.getString(_cachedProductsKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    final products = await getCachedProducts();
    final updatedProducts = products.where((p) => p.id != product.id).toList()
      ..add(product);
    await cacheProducts(updatedProducts);
  }

  @override
  Future<ProductModel> getCachedProductById(String id) async {
    final products = await getCachedProducts();
    final product = products.firstWhere((p) => p.id == id,
        orElse: () => throw Exception('Product not found'));
    return product;
  }

  @override
  Future<void> deleteCachedProduct(String id) async {
    final products = await getCachedProducts();
    final updatedProducts = products.where((p) => p.id != id).toList();
    await cacheProducts(updatedProducts);
  }
}
