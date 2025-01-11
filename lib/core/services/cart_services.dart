import 'package:fruit_hub/core/entities/product_entity.dart';

import '../../features/cart/domain/entity/cart_entity.dart';

class CartServices {
  final List<CartEntity> _cartItems = [];

  List<CartEntity> get getCartItems => [..._cartItems];

  /// method to fetch all list items from firestore and put it to list when user open his app
  /// by this way i should have a persisting data
  void fetchAndReplaceCartItems() async {}

  /// method to increase count and unit by 1
  /// when user add new item in cart he add 1kg to unit if exist and 1 to count if exist
  /// if this item not exist or cartItems is empty. a new item added with unit and count = 1
  void increaseCountAndUnit(CartEntity cartEntity) {
    cartEntity.count++;
    cartEntity.unit++;
  }

  void decreaseCountAndUnit(CartEntity cartEntity) {
    cartEntity.count--;
    cartEntity.unit--;
  }

  bool isFound(ProductEntity productEntity) {
    if (_cartItems.isEmpty) {
      // add this item to cart
      return false;
    } else {
      for (var item in _cartItems) {
        if (item.productEntity.productCode == productEntity.productCode) {
          // item is already in cart so add it's count by 1 and unit by 1 also
          increaseCountAndUnit(item);
          // TODO: update product count and unit in firestore cart collection
          return true;
        }
      }
      // add this item to cart
      return false;
    }
  }

  /// method to add new product in cart it depends on isFound method logic
  void addItem(ProductEntity productEntity) {
    if (!isFound(productEntity)) {
      CartEntity cartEntity =
          CartEntity(productEntity: productEntity, count: 1, unit: 1);
      _cartItems.add(cartEntity);
      // TODO: add this item to firestore cart collection
    }
  }

  void removeItem(String productCode) {
    if (_cartItems.isNotEmpty) {
      _cartItems
          .removeWhere((item) => item.productEntity.productCode == productCode);
      // TODO: remove this item from irestore cart collection
    }
  }

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
