import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
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
        path: LoginView.rn,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
