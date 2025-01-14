import 'package:fruit_hub/features/cart/domain/entity/cart_entity.dart';

import '../../../core/model/product_model.dart';

class CartModel {
  final ProductModel product;
  int count;
  int unit;

  CartModel({
    required this.product,
    this.count = 0,
    this.unit = 0,
  });

  factory CartModel.fromJson(Map<String, dynamic> map) {
    return CartModel(
      product: ProductModel.fromJson(map['product']),
      count: map['count'],
      unit: map['unit'],
    );
  }

  factory CartModel.fromCartEntity(CartEntity cartEntity) {
    return CartModel(
      product: ProductModel.fromEntity(cartEntity.productEntity),
      count: cartEntity.count,
      unit: cartEntity.unit,
    );
  }

  static CartEntity toCartEntity(CartModel cartModel) {
    return CartEntity(
      productEntity: ProductModel.toProductEntity(cartModel.product),
      count: cartModel.count,
      unit: cartModel.unit,
    );
  }

  static Map<String, dynamic> toJson(CartModel cartModel) {
    return {
      'product': ProductModel.toJson(cartModel.product),
      'count': cartModel.count,
      'unit': cartModel.unit,
    };
  }
}
