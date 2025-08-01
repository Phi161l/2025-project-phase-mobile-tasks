## ✅ Task 11: Contracts of Data Sources

### 🎯 Objective
Refactor the domain layer of the Ecommerce app by creating clear contracts (abstract classes) for the repository and its data source dependencies, based on clean architecture principles.

---

### 📁 What Was Done

#### 1. Product Repository Contract (Domain Layer)
Defined an abstract `ProductRepository` interface in `domain/repositories/product_repository.dart`:

```dart
abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(String id);
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
```

This interface describes all the expected behaviors of a product repository in the app.

---

#### 2. Remote Data Source Contract
Created `RemoteDataSource` abstract class in `data/datasources/remote_data_source.dart`:

```dart
abstract class RemoteDataSource {
  Future<List<ProductModel>> fetchAllProducts();
  Future<ProductModel?> fetchProductById(String id);
  Future<void> createProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}
```

This defines how remote data (e.g., from an API) should be fetched and managed.

---

#### 3. Local Data Source Contract
Created `LocalDataSource` abstract class in `data/datasources/local_data_source.dart`:

```dart
abstract class LocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}
```

This outlines how product data should be stored and retrieved locally (e.g., from SQLite or Hive).

---

### ✅ Summary
Task 11 focused only on defining contracts (interfaces) — no implementation logic was added yet. These contracts will help maintain a clean separation of concerns in the data layer and allow flexibility in switching data sources later.

---

