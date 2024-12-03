import 'package:fruit_hub/core/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Preferences {
  /// will be called while click on تخط or ابدأ الان button on onBoarding
  /// this mean that the user see onBoarding screen
  /// so we will use seenOnBoarding key in splash to weather going to
  /// onBoarding or auth screen
  /// for that we will use checkOnBoardingStatus
  static void setOnBoardingStatus() async {
    ServiceLocator.getIt<SharedPreferences>().setBool('seenOnBoarding', true);
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
}
