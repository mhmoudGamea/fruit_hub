import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:fruit_hub/features/auth/domain/repos/phone_auth_repo/phone_auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/repos/phone_auth_repo/phone_auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final FocusNode _countryCodeFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  GlobalKey<FormState> get formKey => _formKey;
  AutovalidateMode get getAutovalidateMode => _autovalidateMode;
  TextEditingController get countryCodeController => _countryCodeController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  FocusNode get countryCodeFocusNode => _countryCodeFocusNode;
  FocusNode get phoneNumberFocusNode => _phoneNumberFocusNode;

  set setAutoValidate(AutovalidateMode auto) {
    _autovalidateMode = auto;
  }

  final PhoneAuthRepo _phoneAuthRepo = GetIt.instance<PhoneAuthRepoImpl>();
  Future<void> sendingOTP({required String number}) async {
    emit(PhoneAuthLoading());
    _phoneAuthRepo.verifyPhoneNumber(number);
  }

  void validate(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (notValidCountryCode()) {
        Helper.errorMessage(context,
            message: 'كود الدولة غير صحيح يجب أن يتكون من 3 أرقام');
      } else if (notValidPhoneNumber()) {
        Helper.errorMessage(context,
            message: 'رقم الهاتف غير صحيح يجب أن يتكون من 10 أرقام');
      } else {
        _formKey.currentState!.save();
        final number =
            '${_countryCodeController.text}${_phoneNumberController.text}';
        await sendingOTP(number: number);
      }
    } else {
      _autovalidateMode = AutovalidateMode.always;
    }
  }

  bool notValidPhoneNumber() {
    if (_phoneNumberController.text.length != 10) {
      return true;
    }
    return false;
  }

  bool notValidCountryCode() {
    if (_countryCodeController.text.length != 3) {
      return true;
    }
    return false;
  }
}
