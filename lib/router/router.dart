import 'package:go_router/go_router.dart';

import '../presentation/bottom_navigation/bottom_navigation_screen.dart';
import '../presentation/splash/splash_screen.dart';
import '../utils/constants.dart';

final router = GoRouter(
    initialLocation: Constants.splashNavigationRoute, routes: [
  GoRoute(
      path: Constants.splashNavigationRoute,
      builder: (context, state) {
        return const SplashScreen();
      }),
  GoRoute(
      path: Constants.bottomNavigationRoute,
      builder: (context, state) {
        return const BottomNavigationScreen();
      }),
]);