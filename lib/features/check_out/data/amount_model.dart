import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/domain/entities/paypal_payment_entity/amount_entity.dart';

import './details_model.dart';

class AmountModel {
  String? total;
  String? currency;
  DetailsModel? details;

  AmountModel({this.total, this.currency, this.details});

  factory AmountModel.fromOrderEntity(OrderEntity orderEntity) {
    return AmountModel(
      total: DetailsModel.calculateTotalPrice(
              DetailsModel.fromOrderEntity(orderEntity))
          .toString(),
      currency: 'USD',
      details: DetailsModel.fromOrderEntity(orderEntity),
    );
  }

  Map<String, dynamic> toMap() => {
        'total': total,
        'currency': currency,
        'details': details?.toMap(),
      };

  factory AmountModel.fromMap(Map<String, dynamic> data) => AmountModel(
        total: data['total'] as String?,
        currency: data['currency'] as String?,
        details: data['details'] == null
            ? null
            : DetailsModel.fromMap(data['details'] as Map<String, dynamic>),
      );

  static AmountEntity toAmountEntity(AmountModel model) {
    return AmountEntity(
      total: model.total,
      currency: model.currency,
      details: DetailsModel.toDetailsEntity(model.details!),
    );
  }
}
