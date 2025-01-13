import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/domain/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/phone_auth_repo/phone_auth_repo_impl.dart';
import '../../features/cart/domain/repos/cart_repo_impl.dart';
import '../repos/product_repo_impl.dart';
import 'firebase_auth_services.dart';
import 'firebase_cart_service.dart';
import 'firebase_firestore_service.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.instance;

  static Future<void> initializeSingletons() async {
    getIt.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<FirebaseFirestoreService>(
        FirebaseFirestoreService());
    getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      firebaseAuthServices: getIt.get<FirebaseAuthServices>(),
      firebaseFirestoreService: getIt.get<FirebaseFirestoreService>(),
    ));
    getIt.registerSingleton<PhoneAuthRepoImpl>(PhoneAuthRepoImpl());
    getIt.registerSingleton<ProductRepoImpl>(ProductRepoImpl());
    getIt.registerSingleton<FirebaseCartService>(FirebaseCartService());
    getIt.registerSingleton<CartRepoImpl>(CartRepoImpl());
  }
}
