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
      case 'unavailable':
        return ServiceException(
            'خدمه السيرفر غير متوفره حاليا. من فضلك حاول مره أخري');
      default:
        return ServiceException('حدث خطأ ما برجاء المحاوله مره أخري.');
    }
  }
  factory ServiceException.fromPhoneAuth({required String code}) {
    switch (code) {
      case 'invalid-phone-number':
        return ServiceException('رقم الهاتف غير صحيح');
      case 'session-expired':
        return ServiceException('انتهت صلاحية الجلسة');
      case 'quota-exceeded':
        return ServiceException('تم تجاوز الحد الأقصى للمحاولات');
      case 'missing-verification-code':
        return ServiceException('كود التحقق مفقود');
      case 'invalid-verification-code':
        return ServiceException('كود التحقق غير صحيح');
      case 'invalid-verification-id':
        return ServiceException('رقم التحقق غير صحيح');
      case 'captcha-check-failed':
        return ServiceException('فشل التحقق من الكابتشا');
      case 'app-not-authorized':
        return ServiceException('التطبيق غير مصرح به');
      case 'missing-app-credential':
        return ServiceException('بيانات التطبيق مفقودة');
      case 'invalid-app-credential':
        return ServiceException('بيانات التطبيق غير صحيحة');
      case 'missing-verification-id':
        return ServiceException('رقم التحقق مفقود');
      default:
        return ServiceException('حدث خطأ ما برجاء المحاوله مره أخري.');
    }
  }
}
