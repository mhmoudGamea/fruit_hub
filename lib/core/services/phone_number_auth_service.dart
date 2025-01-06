import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../error/firebase_exception.dart';

abstract class PhoneNumberAuthService {
  Future<void> verifyPhoneNumber(String phoneNumber);
  //(PhoneAuthCredential credential) {}
  static void phoneAuthCredential(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    log(credential.providerId);
    log(credential.smsCode.toString());
  }

  static void verificationFailes(FirebaseAuthException e) {
    throw ServiceException.fromPhoneAuth(code: e.code);
  }
}
