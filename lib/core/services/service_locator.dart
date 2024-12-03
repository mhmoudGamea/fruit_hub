import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.instance;

  static Future<void> initializeSingletons() async {
    getIt.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
  }
}
