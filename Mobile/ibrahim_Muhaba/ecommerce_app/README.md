# 🧠 Domain Layer – Clean Architecture (Product Module)

This is the **Domain Layer** of the Product module, built using Clean Architecture principles.

---

## 📚 What’s Inside

- **Entities** – core business models
- **Use Cases** – actions the app performs
- **Repositories (abstract)** – contracts for data access

The domain layer is pure Dart and contains no UI, database, or network code.

---

## 📦 Structure

```
domain/
├── entities/            // Product model
├── repositories/        // Abstract contract
└── usecases/            // App-specific logic
```

---

## 🧱 Entity – `Product`

```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}
```

---

## 🔌 Repository Contract

```dart
abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
```

The actual logic will be implemented in the data layer.

---

## 🚀 Use Cases

Each use case wraps one operation and delegates it to the repository.

```dart
class GetAllProductsUseCase {
  final ProductRepository repository;
  GetAllProductsUseCase(this.repository);

  Future<List<Product>> call() => repository.getAllProducts();
}
```

Similar structure is used for:

- `AddProductUseCase`
- `UpdateProductUseCase`
- `DeleteProductUseCase`

---

## ✅ Summary

- Clean, testable, and UI-independent
- Defines **what** the app does
- Leaves **how** to the data & presentation layers

---

