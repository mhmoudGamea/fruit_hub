import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/firebase_auth_services.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:fruit_hub/core/utilies/endpoints.dart';
import 'package:fruit_hub/features/auth/data/user_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exception.dart';
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
      await writeUserData(user: userEntity);
      return right(userEntity);
    } on ServiceException catch (error) {
      log('Exception in AuthrepoImpl.createUserWithEmailAndPassword() method ${error.toString()}');
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

  @override
  Future<Either<Failure, String>> writeUserData(
      {required UserEntity user}) async {
    try {
      log('new message');
      log('رساله جديده');
      await firebaseFirestoreService.writeData(
          path: Endpoints.writeUserData, data: user.toJson());
      log('تم حفظ بيانات المستخدم بنجاح');
      return right('تم حفظ بيانات المستخدم بنجاح');
    } on ServiceException catch (error) {
      return left(ServerFailure(error.message));
    }
  }
}
