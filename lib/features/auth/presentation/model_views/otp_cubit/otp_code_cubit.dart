import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:fruit_hub/features/auth/data/otp_model.dart';
import 'package:fruit_hub/features/auth/data/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/services/preferences.dart';
import '../../../../../core/services/serialization_service.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/utilies/endpoints.dart';
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

  Future<void> saveUserDataInSharedPrefrences(UserEntity user) async {
    final encodedUserData =
        SerializationService.serialize<Map<String, dynamic>>(
            UserModel.fromUserEntity(user).toJson());
    // save user data in shared prefrences
    await Preferences.setValue(key: kUserData, value: encodedUserData);
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
          FirebaseFirestoreService firestoreService =
              GetIt.instance<FirebaseFirestoreService>();
          UserEntity userEntity = UserEntity(
            email: '',
            name: '',
            uid: userCredential.user!.uid,
          );
          firestoreService.writeData(
              path: Endpoints.writeUserData,
              data: UserModel.fromUserEntity(userEntity).toJson(),
              documentId: userCredential.user!.uid);
          await saveUserDataInSharedPrefrences(userEntity);
        } else {
          emit(OtpCodeError(
              'رمز التحقق الذي أدخلته غير صحيح من فضلك حاول مرة أخرى'));
        }
      } catch (e) {
        emit(OtpCodeError(
            'رمز التحقق الذي أدخلته غير صحيح من فضلك حاول مرة أخرى'));
      }
    }
  }
}
