import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
