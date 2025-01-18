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

  static Map<String, dynamic> toJson(PayModel pay) {
    return {
      'cardOwner': pay.cardOwner,
      'cardNumber': pay.cardNumber,
      'expiaryDate': pay.expiaryDate,
      'cvv': pay.cvv,
    };
  }
}
