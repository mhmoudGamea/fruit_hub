import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/firebase_auth_services.dart';
import 'package:fruit_hub/features/auth/data/user_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exception.dart';
import '../entities/user_entity.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await FirebaseAuthServices.signupUser(
          email: email, password: password);
      return right(UserModel.fromUser(user));
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
      final user = await FirebaseAuthServices.loginUser(
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
      final user = await FirebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromUser(user));
    } catch (error) {
      log('Exception in AuthrepoImpl.signinWithGoogle() method ${error.toString()}');
      return left(ServerFailure('حدث خطأ ما برجاء المحاوله مره أخري.'));
    }
  }

  // @override
  // Future<Either<Failure, UserEntity>> signinWithFacebook() async {
  //   try {
  //     final user = await FirebaseAuthServices.signInWithFacebook();
  //     return right(UserModel.fromUser(user));
  //   } catch (error) {
  //     log('Exception in AuthrepoImpl.signinWithFacebook() method ${error.toString()}');
  //     return left(ServerFailure('حدث خطأ ما برجاء المحاوله مره أخري.'));
  //   }
  // }
}
