part of 'product_bloc.dart';

/// Base class for all product states
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}




/// Initial state before any data is loaded
class InitialState extends ProductState {}

/// State when data is loading
class LoadingState extends ProductState {}

/// State when all products are successfully loaded
class LoadedAllProductsState extends ProductState {
  final List<Product> products;

  const LoadedAllProductsState(this.products);

  @override
  List<Object?> get props => [products];
}

/// State when a single product is successfully loaded
class LoadedSingleProductState extends ProductState {
  final Product product;

  const LoadedSingleProductState(this.product);

  @override
  List<Object?> get props => [product];
}

/// State when an error occurs
class ErrorState extends ProductState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
