import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../error/firebase_auth_exception.dart';

abstract class FirebaseAuthServices {
  static final FirebaseAuth _getIt = GetIt.instance<FirebaseAuth>();

  static Future<User> signupUser(
      {required String email, required String password}) async {
    try {
      final credential = await _getIt.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (error) {
      throw ServiceException(error.code);
    } catch (error) {
      throw ServiceException('An error occured, please try again later :)');
    }
  }
}
