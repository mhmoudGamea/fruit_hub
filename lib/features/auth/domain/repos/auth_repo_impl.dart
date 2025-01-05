import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/preferences.dart';
import 'package:fruit_hub/core/services/serialization_service.dart';
import 'package:fruit_hub/core/utilies/constants.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exception.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/firebase_firestore_service.dart';
import '../../../../core/utilies/endpoints.dart';
import '../../data/user_data.dart';
import '../../data/user_model.dart';
import '../entities/user_entity.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final FirebaseFirestoreService firebaseFirestoreService;

  AuthRepoImpl(
      {required this.firebaseAuthServices,
      required this.firebaseFirestoreService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await firebaseAuthServices.signupUser(
          email: email, password: password);
      final userModel = UserModel(email: email, name: name, uid: user.uid);

      final result = await writeUserData(user: userModel);
      await deleteOperation(result);
      return right(userModel);
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.createUserWithEmailAndPassword() method ${error.message}');
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthServices.loginUser(
          email: email, password: password);
      final userEntity = await readUserData(uid: user.uid);
      await saveUserDataInSharedPrefrences(user: userEntity);
      return right(userEntity);
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.loginUserWithEmailAndPassword() method ${error.toString()}');
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      final user = await firebaseAuthServices.signInWithGoogle();
      final userEntity = UserModel.fromUser(user);
      var isUserExist = await firebaseFirestoreService.isDataExist(
          path: Endpoints.isUserExist, uid: userEntity.uid);
      if (isUserExist) {
        // final result = await readUserData(uid: userEntity.uid);
        await readUserData(uid: userEntity.uid);
      } else {
        final userData = await writeUserData(user: userEntity);
        await deleteOperation(userData);
      }

      return right(userEntity);
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.loginUserWithEmailAndPassword() method ${error.toString()}');
      return left(ServerFailure(error.message));
    } catch (error) {
      log('Exception in AuthrepoImpl.signinWithGoogle() method ${error.toString()}');
      return left(ServerFailure('حدث خطأ ما برجاء المحاوله مره أخري.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithPhone() {
    // TODO: implement signinWithPhone
    throw UnimplementedError();
  }

  @override
  Future<UserData> writeUserData({required UserEntity user}) async {
    try {
      await firebaseFirestoreService.writeData(
        path: Endpoints.writeUserData,
        // i get userEntity convert it to userModel then convert it to json
        data: UserModel.fromUserEntity(user).toJson(),
        documentId: user.uid,
      );
      log('تم حفظ بيانات المستخدم بنجاح');
      return UserData(status: true, message: 'تم حفظ بيانات المستخدم بنجاح');
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.writeUserData() method ${error.message}');
      return UserData(status: false, message: error.message);
    }
  }

  @override
  Future<UserEntity> readUserData({required String uid}) async {
    final result = await firebaseFirestoreService.readData(
        path: Endpoints.readUserData, documentId: uid);
    return UserModel.fromDocument(result);
  }

  Future<void> deleteOperation(UserData result) async {
    if (!result.status) {
      await firebaseAuthServices.deleteUser();
      throw ServiceException(result.message);
    }
  }

  @override
  Future<void> saveUserDataInSharedPrefrences(
      {required UserEntity user}) async {
    final encodedUserData =
        SerializationService.serialize<Map<String, dynamic>>(
            UserModel.fromUserEntity(user).toJson());
    // save user data in shared prefrences
    await Preferences.setValue(key: kUserData, value: encodedUserData);
  }
}
