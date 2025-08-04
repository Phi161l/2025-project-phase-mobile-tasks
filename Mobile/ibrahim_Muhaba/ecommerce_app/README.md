# 📦 ProductLocalDataSourceImpl

This module implements local data storage for product data using `SharedPreferences`. It follows clean architecture principles, storing and retrieving data as `ProductModel` (data layer) only.

---

## ✅ Features

- Cache a single product
- Cache a list of products
- Retrieve a cached product by ID
- Retrieve all cached products
- Delete a cached product by ID

---

## 📁 File Structure

```
lib/
└── features/
    └── product/
        └── data/
            └── datasources/
                └── product_local_data_source_impl.dart

test/
└── features/
    └── product/
        └── data/
            └── datasources/
                └── product_local_data_source_impl_test.dart
```

---

## 🧪 Testing

We use the `flutter_test` package and mock `SharedPreferences`:

### Test Scenarios

- ✅ Cache and retrieve a single product by ID
- ✅ Cache and retrieve a list of products
- ✅ Delete a product and expect an exception on retrieval

### Run tests

```bash
flutter test test/features/product/data/datasources/product_local_data_source_impl_test.dart
```

---

## 📦 Dependencies

- `shared_preferences`
- `flutter_test`
- `jsonEncode`, `jsonDecode` from `dart:convert`

---

## 💡 Notes

- The cache key is hardcoded as `CACHED_PRODUCTS`.
- This class operates on models, not domain entities.
- Ensure `ProductModel` has `toJson()` and `fromJson()` implemented.

---


