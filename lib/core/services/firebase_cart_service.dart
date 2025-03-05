import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../error/firebase_exception.dart' show ServiceException;
import '../utilies/constants.dart';
import 'cart_service.dart';

class FirebaseCartService implements CartService {
  ////////////////////////////////////cart methods/////////////////////////
  static final FirebaseFirestore _firebaseFirestore =
      GetIt.instance<FirebaseFirestore>();
  static final FirebaseAuth _firebaseAuth = GetIt.instance<FirebaseAuth>();

  final CollectionReference _collReference = _firebaseFirestore
      .collection(kUsers)
      .doc(_firebaseAuth.currentUser!.uid)
      .collection(kCart);

  @override
  Future<void> addToCart({
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    try {
      await _collReference.doc(documentId).set(data);
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      log('Error in FirebaseFirestoreService: writeData => ${error.toString()}');
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  @override
  Future<void> updateItemInCart(
      String documentId, Map<String, dynamic> data) async {
    try {
      await _collReference.doc(documentId).update(data);
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      log('Error in FirebaseFirestoreService: writeData => ${error.toString()}');
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllItemsInCart() async {
    try {
      final result = await _collReference.get();
      return result.docs
          .map((item) => item.data() as Map<String, dynamic>)
          .toList();
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      log('Error in FirebaseFirestoreService: writeData => ${error.toString()}');
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }
}
