import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../error/firebase_exception.dart';

class FirebaseAuthServices {
  static final FirebaseAuth _getIt = GetIt.instance<FirebaseAuth>();

  Future<User> signupUser(
      {required String email, required String password}) async {
    try {
      final credential = await _getIt.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (error) {
      throw ServiceException.fromAuth(code: error.code);
    } catch (error) {
      throw ServiceException('حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  Future<User> loginUser(
      {required String email, required String password}) async {
    try {
      final credential = await _getIt.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (error) {
      throw ServiceException.fromAuth(code: error.code);
    } catch (error) {
      throw ServiceException('حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> deleteUser() async {
    await _getIt.currentUser!.delete();
  }
}
