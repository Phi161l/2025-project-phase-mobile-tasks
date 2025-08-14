# Task 18: Dependency Injection

Use `get_it` to inject dependencies in Clean Architecture.

1. Add packages in `pubspec.yaml`: `get_it`, `http`, `shared_preferences`, `internet_connection_checker`.  
2. Create service locator: `final sl = GetIt.instance` and `Future<void> init()`.  
3. Register dependencies: Core, External, Data Sources, Repository, Use Cases, Bloc using `sl.registerLazySingleton` or `sl.registerFactory`.  
4. Example Bloc registration:  
   `sl.registerFactory(() => ProductBloc(viewAllProductsUsecase: sl(), viewProductUsecase: sl(), createProductUsecase: sl(), updateProductUsecase: sl(), deleteProductUsecase: sl()));`  

This ensures decoupled, testable, and maintainable code.
