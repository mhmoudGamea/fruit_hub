import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class Navigation {
  // application route names
  static const _splashRoute = '/';

  static get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: _splashRoute,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
