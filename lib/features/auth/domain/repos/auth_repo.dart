import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/user_data.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, UserEntity>> signinWithGoogle();
  // Future<Either<Failure, UserEntity>> signinWithFacebook();
  Future<UserData> writeUserData({required UserEntity user});
  Future<UserEntity> readUserData({required String uid});

  Future<void> saveUserDataInSharedPrefrences({required UserEntity user});
}
