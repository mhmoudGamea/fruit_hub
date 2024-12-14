import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/error/firebase_exception.dart'
    show ServiceException;
import 'package:get_it/get_it.dart';

abstract class DatabaseService {
  Future<void> writeData(
      {required String path, required Map<String, dynamic> data});
}

class FirebaseFirestoreService implements DatabaseService {
  static var firebaseFirestore = GetIt.instance<FirebaseFirestore>();

  @override
  Future<void> writeData(
      {required String path, required Map<String, dynamic> data}) async {
    try {
      await firebaseFirestore.collection(path).add(data);
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }
}
