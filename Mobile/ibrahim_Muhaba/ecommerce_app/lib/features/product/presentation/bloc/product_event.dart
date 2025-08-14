part of 'product_bloc.dart';

/// Base class for all product events
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}




/// Event to load all products
class LoadAllProductsEvent extends ProductEvent {}

/// Event to get a single product by ID
class GetSingleProductEvent extends ProductEvent {
  final String id;

  const GetSingleProductEvent(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to create a new product
class CreateProductEvent extends ProductEvent {
  final Product product;

  const CreateProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}

/// Event to update an existing product
class UpdateProductEvent extends ProductEvent {
  final Product product;

  const UpdateProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}

/// Event to delete a product by ID
class DeleteProductEvent extends ProductEvent {
  final String id;

  const DeleteProductEvent(this.id);

  @override
  List<Object?> get props => [id];
}




