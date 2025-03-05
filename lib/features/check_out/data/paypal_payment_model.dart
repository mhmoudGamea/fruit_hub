import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';

import '../domain/entities/paypal_payment_entity/item_list.dart';
import 'amount_model.dart';

class PaypalPaymentModel {
  AmountModel? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentModel({this.amount, this.description, this.itemList});

  factory PaypalPaymentModel.fromOrderEntity(OrderEntity orderEntity) {
    return PaypalPaymentModel(
      amount: AmountModel.fromOrderEntity(orderEntity),
      description: 'Have a good transaction with paypal',
      itemList: ItemList.fromOrderEntity(orderEntity),
    );
  }

  Map<String, dynamic> toMap() => {
        'amount': amount?.toMap(),
        'description': description,
        'item_list': itemList?.toMap(),
      };

  factory PaypalPaymentModel.fromMap(Map<String, dynamic> data) {
    return PaypalPaymentModel(
      amount: data['amount'] == null
          ? null
          : AmountModel.fromMap(data['amount'] as Map<String, dynamic>),
      description: data['description'] as String?,
      itemList: data['item_list'] == null
          ? null
          : ItemList.fromMap(data['item_list'] as Map<String, dynamic>),
    );
  }

  PaypalPaymentEntity toPaypalPaymentEntity(PaypalPaymentModel model) {
    return PaypalPaymentEntity(
      amount: AmountModel.toAmountEntity(model.amount!),
      description: model.description,
      itemList: model.itemList,
    );
  }
}
