import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class Navigation {
  static get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.rn,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: OnBoardingView.rn,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: SigninView.rn,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        path: SignupView.rn,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: ForgetPasswordView.rn,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
