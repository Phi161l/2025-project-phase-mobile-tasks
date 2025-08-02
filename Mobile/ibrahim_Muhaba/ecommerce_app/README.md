## ✅ Task 12 - Data Layer: ProductRepositoryImpl Implementation & Unit Tests

### 🔨 Implemented
- `ProductRepositoryImpl` class:
  - Handles repository methods: 
    - `getAllProducts()`
    - `getProductById(String id)`
    - `createProduct(Product product)`
    - `updateProduct(Product product)`
    - `deleteProduct(String id)`
  - Chooses between **Remote** and **Local** data sources based on `isConnected`.

- `ProductModel` updated with:
  - `toEntity()` method for converting to domain `Product`.

### 🧪 Unit Tests
- Simple unit tests for `ProductRepositoryImpl` using:
  - `FakeRemoteDataSource`
  - `FakeLocalDataSource`
- Two test cases implemented:
  - When `isConnected == true` → fetches from **remote**
  - When `isConnected == false` → fetches from **local**

### 🗂️ Files Created/Updated
- `lib/features/product/data/repositories/product_repository_impl.dart`
- `lib/features/product/data/models/product_model.dart`
- `test/features/product/data/repositories/product_repository_impl_test.dart`

```
