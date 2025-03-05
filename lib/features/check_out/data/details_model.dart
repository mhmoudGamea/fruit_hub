import 'dart:developer';

import '../domain/entities/order_entity.dart';
import '../domain/entities/paypal_payment_entity/details_entity.dart';

class DetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsModel({
    this.subtotal,
    this.shipping,
    this.shippingDiscount,
  });

  factory DetailsModel.fromOrderEntity(OrderEntity order) {
    return DetailsModel(
      subtotal: order.totalPrice.toString(),
      shipping: order.isCach! ? "30" : "0",
      shippingDiscount: 0,
    );
  }

  Map<String, dynamic> toMap() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsModel.fromMap(Map<String, dynamic> data) => DetailsModel(
        subtotal: data['subtotal'] as String?,
        shipping: data['shipping'] as String?,
        shippingDiscount: data['shipping_discount'] as int?,
      );

  static DetailsEntity toDetailsEntity(DetailsModel model) {
    return DetailsEntity(
      subtotal: model.subtotal,
      shipping: model.shipping,
      shippingDiscount: model.shippingDiscount,
    );
  }

  static double calculateTotalPrice(DetailsModel model) {
    double sub = double.parse(model.subtotal!);
    double ship = double.parse(model.shipping!);
    return (sub + ship) - model.shippingDiscount!;
  }
}
