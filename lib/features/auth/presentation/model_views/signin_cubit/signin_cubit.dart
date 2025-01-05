import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repos/auth_repo.dart';
import '../../../domain/repos/auth_repo_impl.dart';
import 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

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

  /// handling signing user part
  final AuthRepo _authRepo = GetIt.instance<AuthRepoImpl>();
  Future<void> signingUser({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final data = await _authRepo.loginUserWithEmailAndPassword(
        email: email, password: password);
    data.fold((error) {
      emit(SigninFailure(error: error.message));
    }, (userEntity) {
      emit(SigninSuccess(userEntity: userEntity));
      //TODO: save user data in shared prefrences
      _authRepo.saveUserDataInSharedPrefrences(user: userEntity);
      log('user data saved in shared prefrences');
    });
  }

  /// this method will be triggered when Signin button is pressed
  /// it use signingUser method
  Future<void> validateSigninUser() async {
    if (getFormKey.currentState!.validate()) {
      getFormKey.currentState!.save();
      await signingUser(
        email: getEmail,
        password: getPassword,
      );
    } else {
      setAutoValidate = AutovalidateMode.always;
    }
  }

  /// this method will be triggered when Signing with google button is pressed
  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final data = await _authRepo.signinWithGoogle();
    data.fold((error) {
      emit(SigninFailure(error: error.message));
    }, (userEntity) {
      emit(SigninSuccess(userEntity: userEntity));
    });
  }
}
