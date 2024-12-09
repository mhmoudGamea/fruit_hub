import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failure.dart';

import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, UserEntity>> signinWithGoogle();
  // Future<Either<Failure, UserEntity>> signinWithFacebook();
}
