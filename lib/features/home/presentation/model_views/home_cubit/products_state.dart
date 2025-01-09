abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {}

class ProductsFailure extends ProductsState {
  final String error;
  ProductsFailure({required this.error});
}
