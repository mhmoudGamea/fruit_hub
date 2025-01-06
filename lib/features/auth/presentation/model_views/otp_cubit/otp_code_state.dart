abstract class OtpCodeState {}

final class OtpCodeInitial extends OtpCodeState {}

final class OtpCodeLessThan6 extends OtpCodeState {}

final class OtpCodeLoading extends OtpCodeState {}

final class OtpCodeError extends OtpCodeState {
  final String message;

  OtpCodeError(this.message);
}

final class OtpCodeSuccess extends OtpCodeState {}
