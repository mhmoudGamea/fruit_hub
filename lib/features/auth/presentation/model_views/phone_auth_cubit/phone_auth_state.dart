abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthSuccess extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String message;
  PhoneAuthError(this.message);
}
