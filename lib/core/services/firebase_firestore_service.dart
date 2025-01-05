import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../error/firebase_exception.dart' show ServiceException;
import 'database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  static var firebaseFirestore = GetIt.instance<FirebaseFirestore>();

  @override
  Future<void> writeData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        // send document id in case of writing user uid [Authentication]
        await firebaseFirestore.collection(path).doc(documentId).set(data);
      } else {
        // send document id in case of adding ordinary data
        await firebaseFirestore.collection(path).add(data);
      }
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  @override
  Future<Map<String, dynamic>> readData(
      {required String path, required String documentId}) async {
    final result =
        await firebaseFirestore.collection(path).doc(documentId).get();
    return result.data()!;
  }

  @override
  Future<bool> isDataExist({required String path, required String uid}) async {
    final result = await firebaseFirestore.collection(path).doc(uid).get();
    return result.exists;
  }
}
