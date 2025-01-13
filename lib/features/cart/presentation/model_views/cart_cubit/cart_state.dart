abstract class CartState {}

final class CartInitial extends CartState {}

// cart add item states
final class CartAddItemLoading extends CartState {}

final class CartAddItemSuccess extends CartState {
  final String success;
  CartAddItemSuccess(this.success);
}

final class CartAddItemFailure extends CartState {
  final String error;
  CartAddItemFailure(this.error);
}

// cart update item states
final class CartUpdateItemLoading extends CartState {}

final class CartUpdateItemSuccess extends CartState {
  final String success;
  CartUpdateItemSuccess(this.success);
}

final class CartUpdateItemFailure extends CartState {
  final String error;
  CartUpdateItemFailure(this.error);
}

// cart item fetching
final class CartItemFetchLoading extends CartState {}

final class CartItemFetchSuccess extends CartState {}

final class CartItemFetchFailure extends CartState {}
