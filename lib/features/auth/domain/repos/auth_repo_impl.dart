import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exception.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/firebase_firestore_service.dart';
import '../../../../core/utilies/endpoints.dart';
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
      final userEntity = UserModel.fromUser(user);

      final result = await writeUserData(user: userEntity);
      if (!result) {
        await firebaseAuthServices.deleteUser();
        throw ServiceException(
            'لم يتم حفظ بيانات المستخدم بنجاح للاسف. برجاء المحاوله مره أخري');
      }
      return right(userEntity);
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.createUserWithEmailAndPassword() method ${error.message}');
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<bool> writeUserData({required UserEntity user}) async {
    try {
      await firebaseFirestoreService.writeData(
          path: Endpoints.writeUserData, data: user.toJson());
      log('تم حفظ بيانات المستخدم بنجاح');
      return true;
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.writeUserData() method ${error.message}');
      return false;
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
      return right(UserModel.fromUser(user));
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.loginUserWithEmailAndPassword() method ${error.toString()}');
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      final user = await firebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromUser(user));
    } catch (error) {
      log('Exception in AuthrepoImpl.signinWithGoogle() method ${error.toString()}');
      return left(ServerFailure('حدث خطأ ما برجاء المحاوله مره أخري.'));
    }
  }
}
