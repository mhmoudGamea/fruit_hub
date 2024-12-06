import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.instance;

  static Future<void> initializeSingletons() async {
    getIt.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  }
}
