class PayEntity {
  final String? cardOwner;
  final String? cardNumber;
  final String? expiaryDate;
  final String? cvv;

  PayEntity({
    required this.cardOwner,
    required this.cardNumber,
    required this.expiaryDate,
    required this.cvv,
  });
}
