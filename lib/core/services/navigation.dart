import 'package:go_router/go_router.dart';

import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class Navigation {
  // application route names
  static const _splashViewRoute = '/';
  static const _onBoardingViewRoute = '/onBoardingView';

  static get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: _splashViewRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: _onBoardingViewRoute,
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
  );
}
