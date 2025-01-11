import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/services/cart_services.dart';

import '../../../domain/entity/cart_entity.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final CartServices _cartServices = CartServices();

  void addItemToCart(ProductEntity productEntity) {
    _cartServices.addItem(productEntity);
    getTotalPrice();
    emit(CartItemAdded());
  }

  void removeItemFromCart(String code) {
    _cartServices.removeItem(code);
    getTotalPrice();
    emit(CartItemRemoved());
  }

  List<CartEntity> get getAllItems => _cartServices.getCartItems;

  double getTotalPrice() {
    return _cartServices.getTotalPriceForAllItem();
  }
}
