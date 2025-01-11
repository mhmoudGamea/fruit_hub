abstract class CartState {}

final class CartInitial extends CartState {}

final class CartItemAdded extends CartState {}

final class CartItemRemoved extends CartState {}

final class CartLoading extends CartState {}
