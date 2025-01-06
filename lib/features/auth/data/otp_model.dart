class OtpModel {
  final String verificationId;
  final int? resendToken;
  final String phoneNumber;

  OtpModel({
    required this.verificationId,
    required this.resendToken,
    required this.phoneNumber,
  });
}
