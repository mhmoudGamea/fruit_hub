import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/firebase_auth_services.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/domain/repos/auth_repo_impl.dart';

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
  }
}
