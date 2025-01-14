import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/product_entity.dart';
import '../../../domain/entity/cart_entity.dart';
import '../../../domain/repos/cart_repo_impl.dart';
import 'cart_state.dart';

enum Update {
  increment,
  decrement,
}

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepoImpl) : super(CartInitial());
  final CartRepoImpl _cartRepoImpl;

  List<CartEntity> _cartItems = [];

  List<CartEntity> get getCartItems => [..._cartItems];

  /// this method will perform 2 operation behind the sciene
  /// 1- if item exist => update it's count & unit. indexWhere return index
  /// 2- if cart empty || item not exist => add it. indexWhere return -1
  void addItemToCart(ProductEntity productEntity) async {
    var index = _cartItems.indexWhere(
        (item) => item.productEntity.productCode == productEntity.productCode);
    if (index != -1) {
      emit(CartUpdateItemLoading());
      final response =
          await _cartRepoImpl.updateToCart(productEntity, Update.increment);
      response.fold((error) {
        emit(CartUpdateItemFailure(error.message));
      }, (success) {
        _cartItems[index].count += 1;
        _cartItems[index].unit += 1;
        emit(CartUpdateItemSuccess(success));
      });
    } else {
      emit(CartAddItemLoading());
      final response = await _cartRepoImpl.addToCart(productEntity);
      response.fold((error) {
        emit(CartAddItemFailure(error.message));
      }, (success) {
        CartEntity cartEntity =
            CartEntity(productEntity: productEntity, count: 1, unit: 1);
        _cartItems.add(cartEntity);
        emit(CartAddItemSuccess(success));
      });
    }
  }

  int getIndex(String code) {
    return _cartItems
        .indexWhere((item) => item.productEntity.productCode == code);
  }

  Future<void> increaseUpdate(ProductEntity productEntity) async {
    var index = getIndex(productEntity.productCode);
    if (_cartItems[index].count >= 5) {
      emit(ErrorMoreThan5());
    } else {
      emit(IncreaseLoading(key: ValueKey(productEntity.productCode)));
      final response =
          await _cartRepoImpl.updateToCart(productEntity, Update.increment);
      response.fold((error) {
        emit(IncreaseFailure());
      }, (success) {
        _cartItems[index].count += 1;
        _cartItems[index].unit += 1;
        emit(IncreaseSuccess());
      });
    }
  }

  Future<void> decreaseUpdate(ProductEntity productEntity) async {
    var index = getIndex(productEntity.productCode);
    if (_cartItems[index].count <= 1) {
      emit(ErrorLessThan1());
    } else {
      emit(DecreaseLoading(key: ValueKey(productEntity.productCode)));
      final response =
          await _cartRepoImpl.updateToCart(productEntity, Update.decrement);
      response.fold((error) {
        emit(DecreaseFailure());
      }, (success) {
        _cartItems[index].count -= 1;
        _cartItems[index].unit -= 1;
        emit(DecreaseSuccess());
      });
    }
  }

  Future<void> fetchAndSet() async {
    _cartItems.clear();
    emit(CartItemFetchLoading());
    final response = await _cartRepoImpl.fetchCartItems();
    response.fold((error) {
      log('error happen while fetch${error.message}');
      emit(CartItemFetchFailure());
    }, (success) {
      _cartItems = success;
      log('success happen while fetch ${_cartItems.length}');
      emit(CartItemFetchSuccess());
    });
  }

  void removeItemFromCart(String code) {}

  /// method to get price for each cart item
  double getTotalPriceForEachItem(
      {required int productCount, required String priceForEachProduct}) {
    // i use double.parse because priceForEachProduct could be int or double
    return productCount * double.parse(priceForEachProduct);
  }

  /// method to get total price for all cart items
  double getTotalPriceForAllItem() {
    var sum = 0.0;
    if (_cartItems.isNotEmpty) {
      for (var item in _cartItems) {
        sum += getTotalPriceForEachItem(
            productCount: item.count,
            priceForEachProduct: item.productEntity.productPrice);
      }
      return double.parse(sum.toStringAsFixed(2));
    }
    return sum;
  }
}
