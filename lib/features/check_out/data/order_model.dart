import 'dart:developer';

import 'package:fruit_hub/features/cart/data/cart_model.dart';
import 'package:fruit_hub/features/check_out/data/product_model_details.dart';

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
      {required this.cartModel,
      required this.totalPrice,
      required this.uid,
      this.isCach,
      this.address,
      this.pay});

  factory OrderModel.fromOrderEntity(OrderEntity orderEntity) {
    return OrderModel(
      cartModel: orderEntity.cartEntity
          .map((item) => CartModel.fromCartEntity(item))
          .toList(),
      totalPrice: orderEntity.totalPrice,
      uid: orderEntity.uid,
      isCach: orderEntity.isCach,
      address: AddressModel.fromAddressEntity(orderEntity.address!),
      pay: PayModel.fromAddressEntity(orderEntity.pay!),
    );
  }
//orderModel.cartModel.map((item) => CartModel.toJson(item)).toList()
  static Map<String, dynamic> toJson(OrderModel orderModel) {
    log(orderModel.address!.toString());
    return {
      'productItems': orderModel.cartModel
          .map((item) => ProductModelDetails.toJson(item))
          .toList(),
      'totalPrice': orderModel.totalPrice,
      'uid': orderModel.uid,
      'isCach': orderModel.isCach,
      'address': AddressModel.toJson(orderModel.address!),
      'pay': PayModel.toJson(orderModel.pay!),
    };
  }
}
