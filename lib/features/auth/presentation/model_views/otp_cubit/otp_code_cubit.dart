import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/data/otp_model.dart';
import 'package:get_it/get_it.dart';

import 'otp_code_state.dart';

class OtpCodeCubit extends Cubit<OtpCodeState> {
  OtpCodeCubit() : super(OtpCodeInitial());

  /// 6 text controllers for the 6 otp code fields
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final TextEditingController _field4Controller = TextEditingController();
  final TextEditingController _field5Controller = TextEditingController();
  final TextEditingController _field6Controller = TextEditingController();

  // 6 getters for the 6 text controllers
  TextEditingController get field1Controller => _field1Controller;
  TextEditingController get field2Controller => _field2Controller;
  TextEditingController get field3Controller => _field3Controller;
  TextEditingController get field4Controller => _field4Controller;
  TextEditingController get field5Controller => _field5Controller;
  TextEditingController get field6Controller => _field6Controller;

  String getSmsCode() {
    final sms =
        '${_field1Controller.text}${_field2Controller.text}${_field3Controller.text}${_field4Controller.text}${_field5Controller.text}${_field6Controller.text}';
    return sms;
  }

  Future<void> verifyOtpCode(OtpModel otpModel) async {
    emit(OtpCodeLoading());
    final smsCode = getSmsCode();
    if (smsCode.length != 6) {
      emit(OtpCodeError('رمز التحقق الذي أدخلته غير صحيح'));
    } else {
      try {
        final auth = GetIt.instance<FirebaseAuth>();
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: otpModel.verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          emit(OtpCodeSuccess());
        } else {
          log('login failed 0');
          emit(OtpCodeError(
              'رمز التحقق الذي أدخلته غير صحيح من فضلك حاول مرة أخرى'));
        }
      } catch (e) {
        log('login failed 1');
        emit(OtpCodeError(
            'رمز التحقق الذي أدخلته غير صحيح من فضلك حاول مرة أخرى'));
      }
    }
  }
}
