import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/services/phone_number_auth_service.dart';
import 'phone_auth_repo.dart';

class PhoneAuthRepoImpl implements PhoneAuthRepo {
  final FirebaseAuth _firebaseAuth = GetIt.instance<FirebaseAuth>();
  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: PhoneNumberAuthService.phoneAuthCredential,
      verificationFailed: PhoneNumberAuthService.verificationFailes,
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
