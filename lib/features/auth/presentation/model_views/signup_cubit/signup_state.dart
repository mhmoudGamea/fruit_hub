import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

/// states for creating user

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

class SignupFailure extends SignupState {
  final String error;
  SignupFailure({required this.error});
}

/// states for terms and condition

class TermsAndConditionsAccepted extends SignupState {}

class TermsAndConditionsNotAccepted extends SignupState {}
