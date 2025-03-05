import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/error/firebase_exception.dart';
import 'package:get_it/get_it.dart';

import '../utilies/constants.dart';
import 'order_service.dart';

class FirebaseOrderService implements OrderService {
  static final FirebaseFirestore _firebaseFirestore =
      GetIt.instance<FirebaseFirestore>();
  static final FirebaseAuth _firebaseAuth = GetIt.instance<FirebaseAuth>();

  final CollectionReference _collReference = _firebaseFirestore
      .collection(kUsers)
      .doc(_firebaseAuth.currentUser!.uid)
      .collection(kOrder);

  @override
  Future<void> addOrder({required Map<String, dynamic> data}) async {
    try {
      await _collReference.add(data);
    } on FirebaseException catch (error) {
      throw ServiceException.fromFirestore(code: error.code);
    } catch (error) {
      log('Error in FirebaseOrderService: addOrder => ${error.toString()}');
      throw ServiceException(':( حدث خطأ ما. برجاء المحاوله مره أخري');
    }
  }
}
