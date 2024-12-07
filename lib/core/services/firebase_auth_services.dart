import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../error/firebase_exception.dart';

abstract class FirebaseAuthServices {
  static final FirebaseAuth _getIt = GetIt.instance<FirebaseAuth>();

  static Future<User> signupUser(
      {required String email, required String password}) async {
    try {
      final credential = await _getIt.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (error) {
      throw ServiceException.fromAuth(error: error.code);
    } catch (error) {
      throw ServiceException('حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  static Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await _getIt.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw ServiceException.fromAuth(error: error.code);
    } catch (error) {
      throw ServiceException('حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }
}
