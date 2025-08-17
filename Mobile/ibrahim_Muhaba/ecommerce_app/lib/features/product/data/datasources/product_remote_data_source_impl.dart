// ignore: unused_import
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
    // For learning purposes, return local data instead of making API call
    return ApiConstants.getAllLocalProducts(); // This now includes added/updated products
    
    // Your original API code (commented out for now):
    // final response = await client.get(Uri.parse(ApiConstants.products));
    // if (response.statusCode == 200) {
    //   final List decoded = json.decode(response.body);
    //   return decoded.map((e) => ProductModel.fromJson(e)).toList();
    // } else {
    //   throw ServerException('Failed to load products');
    // }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    // For learning purposes, return sample data instead of making API call
    final sampleProduct = ApiConstants.getSampleProductById(id);
    if (sampleProduct != null) {
      return sampleProduct;
    }
    throw ServerException('Product not found with id: $id');
    
    // Your original API code (commented out for now):
    // final response = await client.get(Uri.parse(ApiConstants.productById(id)));
    // if (response.statusCode == 200) {
    //   return ProductModel.fromJson(json.decode(response.body));
    // } else {
    //   throw ServerException('Failed to load product with id: $id');
    // }
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    // For learning purposes, add product locally instead of making API call
    ApiConstants.addLocalProduct(product);
    
    // Your original API code (commented out for now):
    // final response = await client.post(
    //   Uri.parse(ApiConstants.products),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode(product.toJson()),
    // );
    // if (response.statusCode != 201) {
    //   throw ServerException('Failed to add product');
    // }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    // For learning purposes, update product locally instead of making API call
    ApiConstants.updateLocalProduct(product);
    
    // Your original API code (commented out for now):
    // final response = await client.put(
    //   Uri.parse(ApiConstants.productById(product.id)),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode(product.toJson()),
    // );
    // if (response.statusCode != 200) {
    //   throw ServerException('Failed to update product');
    // }
  }

  @override
  Future<void> deleteProduct(String id) async {
    // For learning purposes, delete product locally instead of making API call
    ApiConstants.deleteLocalProduct(id);
    
    // Your original API code (commented out for now):
    // final response = await client.delete(Uri.parse(ApiConstants.productById(id)));
    // if (response.statusCode != 200) {
    //   throw ServerException('Failed to delete product');
    // }
  }
}










// the full previous code .  just to not get confused when uncomment lines in the above code when you got the real api and used that:

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../../../../core/constants/api_constants.dart';
// import '../../../../core/errors/exceptions.dart';
// import '../models/product_model.dart';
// import 'product_remote_data_source.dart';

// class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
//   final http.Client client;

//   ProductRemoteDataSourceImpl({required this.client});

//   @override
//   Future<List<ProductModel>> getAllProducts() async {
//     final response = await client.get(Uri.parse(ApiConstants.products));

//     if (response.statusCode == 200) {
//       final List decoded = json.decode(response.body);
//       return decoded.map((e) => ProductModel.fromJson(e)).toList();
//     } else {
//       throw ServerException('Failed to load products');
//     }
//   }

//   @override
//   Future<ProductModel> getProductById(String id) async {
//     final response = await client.get(Uri.parse(ApiConstants.productById(id)));

//     if (response.statusCode == 200) {
//       return ProductModel.fromJson(json.decode(response.body));
//     } else {
//     } else {
//       throw ServerException('Failed to load product with id: $id');
//     }
//   }

//   @override
//   Future<void> addProduct(ProductModel product) async {
//     final response = await client.post(
//       Uri.parse(ApiConstants.products),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(product.toJson()),
//     );

//     if (response.statusCode != 201) {
//       throw ServerException('Failed to add product');
//     }
//   }

//   @override
//   Future<void> updateProduct(ProductModel product) async {
//     final response = await client.put(
//       Uri.parse(ApiConstants.productById(product.id)),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(product.toJson()),
//     );

//     if (response.statusCode != 200) {
//       throw ServerException('Failed to update product');
//     }
//   }

//   @override
//   Future<void> deleteProduct(String id) async {
//     final response = await client.delete(Uri.parse(ApiConstants.productById(id)));

//     if (response.statusCode != 200) {
//       throw ServerException('Failed to delete product');
//     }
//   }
// }