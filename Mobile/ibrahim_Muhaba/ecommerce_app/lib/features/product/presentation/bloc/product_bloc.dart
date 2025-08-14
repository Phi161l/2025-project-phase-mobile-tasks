import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/create_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import '../../domain/usecases/view_all_products_usecase.dart';
import '../../domain/usecases/view_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ViewAllProductsUsecase viewAllProductsUsecase;
  final ViewProductUsecase viewProductUsecase;
  final CreateProductUsecase createProductUsecase;
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;

  ProductBloc({
    required this.viewAllProductsUsecase,
    required this.viewProductUsecase,
    required this.createProductUsecase,
    required this.updateProductUsecase,
    required this.deleteProductUsecase,
  }) : super(InitialState()) {
    // Load all products
    on<LoadAllProductsEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final products = await viewAllProductsUsecase();
        emit(LoadedAllProductsState(products));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    // Load single product
    on<GetSingleProductEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final product = await viewProductUsecase(event.id);
        if (product != null) {
          emit(LoadedSingleProductState(product));
        } else {
          emit(const ErrorState('Product not found'));
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    // Create product
    on<CreateProductEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await createProductUsecase(event.product);
        final products = await viewAllProductsUsecase();
        emit(LoadedAllProductsState(products));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    // Update product
    on<UpdateProductEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await updateProductUsecase(event.product);
        final products = await viewAllProductsUsecase();
        emit(LoadedAllProductsState(products));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    // Delete product
    on<DeleteProductEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await deleteProductUsecase(event.id);
        final products = await viewAllProductsUsecase();
        emit(LoadedAllProductsState(products));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
