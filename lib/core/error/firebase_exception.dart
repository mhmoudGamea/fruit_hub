abstract class FirebaseException {
  final String message;
  FirebaseException(this.message);
}

class ServiceException extends FirebaseException {
  ServiceException(super.message);

  factory ServiceException.fromAuth({required String code}) {
    if (code == 'weak-password') {
      return ServiceException(
          'هذا الرقم السري ضعيف للغايه. برجاء كتابه رقم سري اقوي');
    } else if (code == 'email-already-in-use') {
      return ServiceException('لقد قمت بالتسجيل مسبقا. برجاء تسجيل الدخول');
    } else if (code == 'user-not-found') {
      return ServiceException(
          'البريد الإلكتروني او الرقم السري الذي قمت بإدخاله خاطئ.');
    } else if (code == 'wrong-password') {
      return ServiceException(
          'البريد الإلكتروني او الرقم السري الذي قمت بإدخاله خاطئ.');
    } else if (code == 'invalid-credential') {
      return ServiceException('مش عارف اقولك ايه بصراحه');
    } else if (code == 'network-request-failed') {
      return ServiceException(
          'لا يوجد اتصال بالإنترنت. برجاء التأكد من انك متصل بالإنترنت');
    } else {
      return ServiceException('حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  factory ServiceException.fromFirestore({required String code}) {
    switch (code) {
      case 'permission-denied':
        return ServiceException(
            'تم رفض الإذن. تحقق من قواعد البيانات الخاصه بك.');
      case 'unauthenticated':
        return ServiceException('المستخدم غير مصرح');
      case 'data-loss':
        return ServiceException('تم فقدان البيانات. حجم المستند يتجاوز الحد');
      case 'unimplemented':
        return ServiceException('عملية غير منفذة');
      case 'cancelled':
        return ServiceException('تم إلغاء العملية');
      default:
        return ServiceException('حدث خطأ ما برجاء المحاوله مره أخري.');
    }
  }
}
