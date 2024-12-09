import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repos/auth_repo.dart';
import '../../../domain/repos/auth_repo_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  /// validation part in form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _autovalidateMode = AutovalidateMode.disabled;

  late String _email;
  late String _password;

  GlobalKey<FormState> get getFormKey {
    return _formKey;
  }

  set setAutoValidate(AutovalidateMode auto) {
    _autovalidateMode = auto;
  }

  AutovalidateMode get getAutoValidate {
    return _autovalidateMode;
  }

  set setEmail(String email) {
    _email = email;
  }

  set setPassword(String password) {
    _password = password;
  }

  String get getEmail {
    return _email;
  }

  String get getPassword {
    return _password;
  }

  /// handling loging user part
  final AuthRepo _authRepo = GetIt.instance<AuthRepoImpl>();
  Future<void> logingUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final data = await _authRepo.loginUserWithEmailAndPassword(
        email: email, password: password);
    data.fold((error) {
      emit(LoginFailure(error: error.message));
    }, (userEntity) {
      emit(LoginSuccess(userEntity: userEntity));
    });
  }

  /// this method will be triggered when login button is pressed
  /// it use logingUser method
  void signinUser() {
    if (getFormKey.currentState!.validate()) {
      getFormKey.currentState!.save();
      logingUser(
        email: getEmail,
        password: getPassword,
      );
    } else {
      setAutoValidate = AutovalidateMode.always;
    }
  }

  /// this method will be triggered when login with google button is pressed
  Future<void> signinWithGoogle() async {
    emit(LoginLoading());
    final data = await _authRepo.signinWithGoogle();
    data.fold((error) {
      emit(LoginFailure(error: error.message));
    }, (userEntity) {
      emit(LoginSuccess(userEntity: userEntity));
    });
  }

  // /// this method will be triggered when login with facebook button is pressed
  // Future<void> signinWithFacebook() async {
  //   emit(LoginLoading());
  //   final data = await _authRepo.signinWithFacebook();
  //   data.fold((error) {
  //     emit(LoginFailure(error: error.message));
  //   }, (userEntity) {
  //     emit(LoginSuccess(userEntity: userEntity));
  //   });
  // }
}
