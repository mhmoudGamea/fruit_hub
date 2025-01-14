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

// cart increase item states
final class ErrorMoreThan5 extends CartState {}

final class IncreaseLoading extends CartState {}

final class IncreaseSuccess extends CartState {}

final class IncreaseFailure extends CartState {}

// cart decrease item states
final class ErrorLessThan1 extends CartState {}

final class DecreaseLoading extends CartState {}

final class DecreaseSuccess extends CartState {}

final class DecreaseFailure extends CartState {}

// cart item fetching
final class CartItemFetchLoading extends CartState {}

final class CartItemFetchSuccess extends CartState {}

final class CartItemFetchFailure extends CartState {}
