import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/auth/data/otp_model.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/otp_view.dart';
import '../error/firebase_exception.dart';

abstract class PhoneNumberAuthService {
  // Future<void> verifyPhoneNumber(String phoneNumber);
  //(PhoneAuthCredential credential) {}
  static void phoneAuthCredential(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static void verificationFailes(FirebaseAuthException e) {
    throw ServiceException.fromPhoneAuth(code: e.code);
  }

  static void codeSent(BuildContext context, OtpModel otpModel) {
    GoRouter.of(context).pushReplacement(OtpView.rn, extra: otpModel);
  }
}
