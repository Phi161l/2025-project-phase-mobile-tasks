# 🛍️ E-Commerce App – Clean Architecture Overview

This project is structured using **Clean Architecture** principles to improve scalability, testability, and separation of concerns. The current feature under refactor is the **Product** module.

---

## 📦 Folder Structure

```
lib/
├── core/                  # Shared logic (e.g., error handling, constants)
├── features/
│   └── product/           # E-commerce product feature
│       ├── domain/
│       │   ├── entities/              # Core business objects (no dependencies)
│       │   │   └── product.dart
│       │   ├── repositories/          # Abstract contracts for data
│       │   │   └── product_repository.dart
│       │   └── usecases/              # Application-specific logic
│       │       ├── create_product_usecase.dart
│       │       ├── delete_product_usecase.dart
│       │       ├── update_product_usecase.dart
│       │       ├── view_all_products_usecase.dart
│       │       └── view_product_usecase.dart
│       └── data/
│           └── models/                # Implementation of entities with JSON support
│               └── product_model.dart

test/
└── features/
    └── product/
        └── data/
            └── models/
                └── product_model_test.dart
```

---

## 🧱 Layers Overview

### 1. **Domain Layer**
- Defines the `Product` entity representing core business logic.
- Contains abstract `ProductRepository` for data access abstraction.
- Implements all 5 use cases:
  - `ViewAllProducts`
  - `ViewProduct`
  - `CreateProduct`
  - `UpdateProduct`
  - `DeleteProduct`

### 2. **Data Layer**
- Includes `ProductModel`, which extends the `Product` entity.
- Adds `fromJson()` and `toJson()` for serialization/deserialization.
- This layer will later include remote/local data sources and repository implementation.

---

## 🔁 Data Flow

```
API ⇄ ProductModel ⇄ Product (Entity) ⇄ UseCases ⇄ UI
```

---

## 🧪 Testing

- ✅ Unit test added for `ProductModel` to verify serialization and deserialization logic.
- Test files mirror the structure of the main code for easier maintenance.

---

## ✅ Status

- [x] Domain layer implemented
- [x] ProductModel completed
- [x] Unit tested ProductModel
- [ ] Repository implementation (next task)
- [ ] Data source (coming later)

---

## 📌 Notes

- The `product/` feature under `features/` follows Clean Architecture principles.
- Refactor is being done incrementally while keeping the app functional.
- All business rules are kept independent of frameworks or platforms.

---


