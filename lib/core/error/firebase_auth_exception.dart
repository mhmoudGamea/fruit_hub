abstract class FirebaseException {
  final String message;
  FirebaseException(this.message);
}

class ServiceException extends FirebaseException {
  ServiceException(super.message);

  factory ServiceException.fromAuth({required String error}) {
    if (error == 'weak-password') {
      return ServiceException('The password provided is too weak');
    } else if (error == 'email-already-in-use') {
      return ServiceException('The account already exists for that email.');
    } else if (error == 'user-not-found') {
      return ServiceException('No user found for that email.');
    } else if (error == 'wrong-password') {
      return ServiceException('Wrong password provided for that user.');
    } else {
      return ServiceException('An error occured, please try again later.');
    }
  }
}
