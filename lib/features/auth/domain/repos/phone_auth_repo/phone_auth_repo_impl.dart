import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/data/otp_model.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/services/phone_number_auth_service.dart';
import 'phone_auth_repo.dart';

class PhoneAuthRepoImpl implements PhoneAuthRepo {
  final FirebaseAuth _firebaseAuth = GetIt.instance<FirebaseAuth>();
  @override
  Future<void> verifyPhoneNumber(
      BuildContext context, String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: PhoneNumberAuthService.phoneAuthCredential,
      verificationFailed: PhoneNumberAuthService.verificationFailes,
      codeSent: (verificationId, resendToken) {
        final OtpModel otpModel = OtpModel(
          verificationId: verificationId,
          resendToken: resendToken,
          phoneNumber: phoneNumber,
        );
        PhoneNumberAuthService.codeSent(context, otpModel);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
