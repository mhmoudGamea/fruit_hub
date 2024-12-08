import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/utilies/helper.dart';
import '../../../domain/repos/auth_repo.dart';
import '../../../domain/repos/auth_repo_impl.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  /// validation part in form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _autovalidateMode = AutovalidateMode.disabled;
  late String _name;
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

  set setName(String name) {
    _name = name;
  }

  set setEmail(String email) {
    _email = email;
  }

  set setPassword(String password) {
    _password = password;
  }

  String get getName {
    return _name;
  }

  String get getEmail {
    return _email;
  }

  String get getPassword {
    return _password;
  }

  /// handling create new user part
  final AuthRepo _authRepo = GetIt.instance<AuthRepoImpl>();
  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final data = await _authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    data.fold((error) {
      emit(SignupFailure(error: error.message));
    }, (userEntity) {
      emit(SignupSuccess(userEntity: userEntity));
    });
  }

  /// this method will be triggered when create new user button is pressed
  /// it use signupUser method
  void createNewUser(BuildContext context) {
    if (getFormKey.currentState!.validate()) {
      getFormKey.currentState!.save();
      if (getIsChecked) {
        signupUser(
          name: getName,
          email: getEmail,
          password: getPassword,
        );
      } else {
        Helper.successMessage(context,
            message: 'من فضلك قم بمراجعه الشروط والاحكام لإنشاء حساب جديد.');
      }
    } else {
      setAutoValidate = AutovalidateMode.always;
    }
  }

  /// handling terms and conditions part
  var _isChecked = false;

  void checkTermsAndConditions() {
    _isChecked = !_isChecked;
    _isChecked
        ? emit(TermsAndConditionsAccepted())
        : emit(TermsAndConditionsNotAccepted());
  }

  bool get getIsChecked {
    return _isChecked;
  }
}
