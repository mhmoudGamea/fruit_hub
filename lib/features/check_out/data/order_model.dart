import 'package:fruit_hub/features/cart/data/cart_model.dart';

import '../domain/entities/order_entity.dart';
import 'address_model.dart';
import 'pay_model.dart';

class OrderModel {
  final List<CartModel> cartModel;
  final double totalPrice;
  final String uid;
  bool? isCach;
  AddressModel? address;
  PayModel? pay;

  OrderModel(
      {required this.cartModel, required this.totalPrice, required this.uid});

  factory OrderModel.fromJson(OrderEntity orderEntity) {
    return OrderModel(
      cartModel: orderEntity.cartEntity
          .map((item) => CartModel.fromCartEntity(item))
          .toList(),
      totalPrice: orderEntity.totalPrice,
      uid: orderEntity.uid,
    );
  }

  static Map<String, dynamic> toJson(OrderModel orderModel) {
    return {
      'cartItems':
          orderModel.cartModel.map((item) => CartModel.toJson(item)).toList(),
      'totalPrice': orderModel.totalPrice,
      'uid': orderModel.uid,
      'isCach': orderModel.isCach,
      'address': AddressModel.toJson(orderModel.address!),
      'pay': PayModel.toJson(orderModel.pay!),
    };
  }
}
