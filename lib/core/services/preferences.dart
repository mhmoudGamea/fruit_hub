import 'package:fruit_hub/core/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Preferences {
  /// will be called while click on تخط or ابدأ الان button on onBoarding
  /// this mean that the user see onBoarding screen
  /// so we will use seenOnBoarding key in splash to weather going to
  /// onBoarding or auth screen
  /// for that we will use checkOnBoardingStatus
  static void setOnBoardingStatus() async {
    await ServiceLocator.getIt<SharedPreferences>()
        .setBool('seenOnBoarding', true);
  }

  /// this will be used in splash so if seenOnBoarding == true
  /// it mean that the user see onBoarding so we 'll go directly to auth
  /// if it's == null it 'll return false which mean the user doesn't
  /// press on تخط or ابدأ الان button so it is his first time in our app
  static bool checkOnBoardingStatus() {
    return ServiceLocator.getIt<SharedPreferences>()
            .getBool('seenOnBoarding') ??
        false;
  }

  // method for set value in sharedPreferences
  static Future<void> setValue(
      {required String key, required dynamic value}) async {
    final pref = ServiceLocator.getIt<SharedPreferences>();
    if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is String) {
      await pref.setString(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  // method for get value from sharedPreferences
  static dynamic getValue({required String key}) {
    final pref = ServiceLocator.getIt<SharedPreferences>();
    return pref.get(key);
  }
}
