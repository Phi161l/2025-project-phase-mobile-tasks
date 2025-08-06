# 🧩 Task 15: Implement Remote Data Source

This module implements the remote data source of the Ecommerce App following the clean architecture structure.

## 📂 File Structure

```
lib/
└── data/
    └── datasources/
        └── product_remote_datasource_impl.dart
test/
└── data/
    └── datasources/
        └── product_remote_datasource_impl_test.dart
```

## 📌 Description

This task covers the implementation of the remote data source, `ProductRemoteDataSourceImpl`, which performs HTTP operations like fetching, adding, updating, and deleting products from the remote server.

## 🔗 API Details

- **Base URL**: ``
- The API endpoints used are:
  - `GET /products` – get all products
  - `GET /products/{id}` – get a product by ID
  - `POST /products` – add a product
  - `PUT /products/{id}` – update a product
  - `DELETE /products/{id}` – delete a product

## ✅ Implemented Methods

- `getAllProducts()`
- `getProductById(String id)`
- `addProduct(ProductModel product)`
- `updateProduct(ProductModel product)`
- `deleteProduct(String id)`

All methods are implemented using the `http` package and return models or complete without error if successful.

## 🧪 Test Coverage

Tests are written using `mockito` and `test` to:
- Verify correct HTTP method and endpoint usage
- Handle successful responses
- Handle error (non-200) responses

Each method in the remote data source has a corresponding unit test.

## 🚀 How to Run Tests

Make sure dependencies are installed and run:

```bash
flutter test test/data/datasources/product_remote_datasource_impl_test.dart
```

## ✅ Task Status

- [x] Implemented `ProductRemoteDataSourceImpl`
- [x] Covered all methods with tests
- [x] Pushed to GitHub
