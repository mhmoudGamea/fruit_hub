import 'package:flutter/foundation.dart';
import 'package:fruit_hub/features/check_out/domain/entities/pay_entity.dart';

class PayModel {
  final String? cardOwner;
  final String? cardNumber;
  final String? expiaryDate;
  final String? cvv;

  PayModel({
    required this.cardOwner,
    required this.cardNumber,
    required this.expiaryDate,
    required this.cvv,
  });

  factory PayModel.fromAddressEntity(PayEntity payEntity) {
    return PayModel(
        cardOwner: payEntity.cardOwner,
        cardNumber: payEntity.cardNumber,
        expiaryDate: payEntity.expiaryDate,
        cvv: payEntity.cvv);
  }

  static Map<String, dynamic> toJson(PayModel pay) {
    return {
      'cardOwner': pay.cardOwner,
      'cardNumber': pay.cardNumber,
      'expiaryDate': pay.expiaryDate,
      'cvv': pay.cvv,
    };
  }
}
