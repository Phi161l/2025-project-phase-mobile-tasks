import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/product/data/datasources/product_local_data_source.dart';
import '../../features/product/data/datasources/product_local_data_source_impl.dart';
import '../../features/product/data/datasources/product_remote_data_source.dart';
import '../../features/product/data/datasources/product_remote_data_source_impl.dart';
import '../../features/product/data/repositories/product_repository_impl.dart';
import '../../features/product/domain/repositories/product_repository.dart';
import '../../features/product/domain/usecases/create_product_usecase.dart';
import '../../features/product/domain/usecases/delete_product_usecase.dart';
import '../../features/product/domain/usecases/update_product_usecase.dart';
import '../../features/product/domain/usecases/view_all_products_usecase.dart';
import '../../features/product/domain/usecases/view_product_usecase.dart';
import '../../features/product/presentation/bloc/product_bloc.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // -------------------------
  // Core
  // -------------------------
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker.instance),
  );

  // -------------------------
  // External
  // -------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);

  // -------------------------
  // Data Sources
  // -------------------------
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );

  // -------------------------
  // Repository
  // -------------------------
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      isConnected: true, // optional, NetworkInfo is already injected
    ),
  );

  // -------------------------
  // Use Cases
  // -------------------------
  sl.registerLazySingleton(() => ViewAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => ViewProductUsecase(sl()));
  sl.registerLazySingleton(() => CreateProductUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(sl()));

  // -------------------------
  // Bloc
  // -------------------------
  sl.registerFactory(
    () => ProductBloc(
      viewAllProductsUsecase: sl(),
      viewProductUsecase: sl(),
      createProductUsecase: sl(),
      updateProductUsecase: sl(),
      deleteProductUsecase: sl(),
    ),
  );
}


