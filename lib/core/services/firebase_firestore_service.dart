import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../error/firebase_exception.dart' show ServiceException;
import 'firestore_service.dart';

class FirebaseFirestoreService implements FirestoreService {
  static final FirebaseFirestore _firebaseFirestore =
      GetIt.instance<FirebaseFirestore>();

  @override
  Future<void> writeData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        // send document id in case of writing user uid [Authentication]
        await _firebaseFirestore.collection(path).doc(documentId).set(data);
      } else {
        // send document id in case of adding ordinary data
        await _firebaseFirestore.collection(path).add(data);
      }
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      log('Error in FirebaseFirestoreService: writeData => ${error.toString()}');
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  @override
  Future<dynamic> readData({
    required String path,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        final result =
            await _firebaseFirestore.collection(path).doc(documentId).get();
        return result.data()!;
      } else {
        final result = await _firebaseFirestore.collection(path).get();
        return result.docs.map((e) => e.data()).toList();
      }
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      log('Error in FirebaseFirestoreService: readData => ${error.toString()}');
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  @override
  Future<bool> isDataExist({required String path, required String uid}) async {
    final result = await _firebaseFirestore.collection(path).doc(uid).get();
    return result.exists;
  }
}
