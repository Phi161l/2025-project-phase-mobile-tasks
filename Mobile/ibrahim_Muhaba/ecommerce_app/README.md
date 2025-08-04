# 🧱 Clean Architecture — Domain & Data Layer

This project follows the Clean Architecture principles in Flutter, currently focusing on the **Domain** and **Data** layers for managing products.

---

## ✅ Domain Layer

- **Entities**
  - `Product`: Represents the product data model with id, name, description, and price.

- **Repository Contract**
  - `ProductRepository`: Abstract contract to define product-related operations (get all products, add, update, delete).

- **Use Cases**
  - `GetAllProductsUseCase`
  - `AddProductUseCase`
  - `UpdateProductUseCase`
  - `DeleteProductUseCase`

---

## ✅ Data Layer

- **Model**
  - `ProductModel`: Extends the `Product` entity and includes `fromJson()` and `toJson()` for serialization.

- **Data Sources**
  - `LocalProductDataSource`: Handles data stored locally (e.g., local DB, file).
  - `RemoteProductDataSource`: Handles data from the server or API.

- **Repository Implementation**
  - `ProductRepositoryImpl`: Implements the `ProductRepository` contract.
    - Uses both local and remote data sources.
    - Chooses source based on internet connection.

- **Network Info**
  - `NetworkInfo`: Abstract class to check internet availability.
  - `NetworkInfoImpl`: Implementation using `internet_connection_checker`.

---

## 🔧 Dependency

Add this in `pubspec.yaml` for network checking:

```yaml
dependencies:
  internet_connection_checker: ^1.0.0+1
```

---

## 📦 Structure Overview

```
lib/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/
│   ├── models/
│   ├── datasources/
│   ├── repository_impl/
│   └── network/
```

---

