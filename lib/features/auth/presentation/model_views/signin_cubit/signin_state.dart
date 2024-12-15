import '../../../domain/entities/user_entity.dart';

abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}

class SigninFailure extends SigninState {
  final String error;
  SigninFailure({required this.error});
}
