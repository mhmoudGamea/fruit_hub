abstract class FirebaseException {
  final String message;
  FirebaseException(this.message);
}

class ServiceException extends FirebaseException {
  ServiceException(super.message);

  factory ServiceException.fromAuth({required String error}) {
    if (error == 'weak-password') {
      return ServiceException(
          'هذا الرقم السري ضعيف للغايه. برجاء كتابه رقم سري اقوي');
    } else if (error == 'email-already-in-use') {
      return ServiceException('لقد قمت بالتسجيل مسبقا. برجاء تسجيل الدخول');
    } else if (error == 'user-not-found') {
      return ServiceException('لا يوجد مستخدم بهذا الايميل');
    } else if (error == 'wrong-password') {
      return ServiceException('الرقم السري الذي قمت بإدخاله خاطئ.');
    } else if (error == 'network-request-failed') {
      return ServiceException(
          'لا يوجد اتصال بالإنترنت. برجاء التأكد من انك متصل بالإنترنت');
    } else {
      return ServiceException('حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }
}
